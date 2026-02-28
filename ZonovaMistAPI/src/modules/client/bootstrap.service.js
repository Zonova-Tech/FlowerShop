export function buildBootstrapGuidance() {
  return {
    flutterCommand: 'flutter create -t app <app-directory>',
    migrationScript: './scripts/recreate_flutter_project.sh',
    movePlan: [
      'Copy lib/ from current project to new project',
      'Copy assets/ and merge pubspec.yaml dependencies/assets',
      'Run flutter pub get',
      'If gradle-wrapper.jar is missing, run ./scripts/bootstrap_android_wrapper.sh',
      'Run flutter run/build from regenerated project',
    ],
    note: 'Use this flow when Flutter reports an unsupported Android/iOS Gradle project and when PR systems disallow committed binaries.',
  };
}
