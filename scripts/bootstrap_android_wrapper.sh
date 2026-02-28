#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
ANDROID_DIR="$ROOT_DIR/android"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

pushd "$TMP_DIR" >/dev/null
cat > build.gradle <<'GRADLE'
// temporary bootstrap build for generating gradle wrapper jar
GRADLE

# --no-validate-url avoids network validation during wrapper task generation.
gradle wrapper --gradle-version 8.4 --no-validate-url --no-daemon >/dev/null
popd >/dev/null

mkdir -p "$ANDROID_DIR/gradle/wrapper"
cp "$TMP_DIR/gradle/wrapper/gradle-wrapper.jar" "$ANDROID_DIR/gradle/wrapper/"

echo "Generated $ANDROID_DIR/gradle/wrapper/gradle-wrapper.jar"
