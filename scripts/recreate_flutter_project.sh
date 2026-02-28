#!/usr/bin/env bash
set -euo pipefail

APP_DIR=${1:-.}
TMP_DIR=$(mktemp -d)

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo "Creating clean Flutter app template..."
flutter create -t app "$TMP_DIR/zonova_flowers_tmp"

# Copy generated project-level native/tooling files.
rsync -a --delete "$TMP_DIR/zonova_flowers_tmp/android/" "$APP_DIR/android/"
rsync -a --delete "$TMP_DIR/zonova_flowers_tmp/ios/" "$APP_DIR/ios/"
rsync -a --delete "$TMP_DIR/zonova_flowers_tmp/web/" "$APP_DIR/web/"
cp "$TMP_DIR/zonova_flowers_tmp/.metadata" "$APP_DIR/.metadata"
cp "$TMP_DIR/zonova_flowers_tmp/.gitignore" "$APP_DIR/.gitignore"


echo "Done. Native scaffolding refreshed."

# Ensure gradle-wrapper.jar exists after refresh (binary not committed).
"$(dirname "$0")/bootstrap_android_wrapper.sh"
