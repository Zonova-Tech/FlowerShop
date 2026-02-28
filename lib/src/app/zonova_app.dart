import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../presentation/widgets/dashboard_shell.dart';

class ZonovaApp extends StatelessWidget {
  const ZonovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zonova Flowers',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const DashboardShell(),
    );
  }
}
