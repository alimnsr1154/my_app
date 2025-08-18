import 'package:flutter/material.dart';
import 'package:my_app/app/routes/app_router.dart';
import 'package:my_app/app/ui/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter router = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      routerConfig: router.config(),
      theme: AppTheme.light,
    );
  }
}
