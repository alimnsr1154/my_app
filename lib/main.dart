import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/stats/controllers/products_controller.dart';
import 'package:my_app/app/modules/stats/controllers/stats_controller.dart';
import 'package:my_app/app/routes/app_router.dart';
import 'package:my_app/app/ui/theme/app_themes.dart';

void main() {
  // Register controllers/services before app starts
  Get.lazyPut<StatsController>(() => StatsController());
  Get.lazyPut<ProductsController>(() => ProductsController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      routerConfig: router.config(),
      theme: AppTheme.light,
    );
  }
}
