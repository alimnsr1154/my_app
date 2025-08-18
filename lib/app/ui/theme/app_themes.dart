import 'package:flutter/material.dart';
import 'package:my_app/app/ui/colors/colors.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme:  AppBarTheme(
        elevation: 0,
        color: AppColors.primaryColors.baseColors.white,
      ),
      scaffoldBackgroundColor: AppColors.primaryColors.baseColors.white,
      primaryColor: AppColors.primaryColors.primaryColor,
      splashColor: Colors.transparent,
       fontFamily: "Pretendard",
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColors.primaryColor),
    );
  }
}

