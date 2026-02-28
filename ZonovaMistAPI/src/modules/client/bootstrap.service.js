export function buildBootstrapGuidance() {
  return {
    flutterCommand: 'flutter create -t app <app-directory>',
    migrationScript: './scripts/recreate_flutter_project.sh',
    note: 'Run this when your local Flutter toolchain reports unsupported Android/iOS project files.',
  };
}
