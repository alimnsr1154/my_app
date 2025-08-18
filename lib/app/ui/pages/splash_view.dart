import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/routes/app_router.dart';
import 'package:my_app/app/ui/colors/colors.dart';
import 'package:my_app/app/ui/utils/assets.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Zoom-in animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    // Navigate to HomePage after 2 seconds
    Timer(const Duration(seconds: 2), () {
      context.replaceRoute(const HomeRoute());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColors.baseColors.white,
        body: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              Assets.images.splash,
              fit: BoxFit.cover,
              height: deviceHeight,
              width: deviceWidth,
            ),
          ),
        ),
      ),
    );
  }
}
