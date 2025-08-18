import 'dart:math';
import 'package:flutter/material.dart';

class AppTypography {
  static DisplayFont display(BuildContext context) => DisplayFont(context);
  static TextFont text(BuildContext context) => TextFont(context);
}

class DisplayFont {
  final BuildContext context;
  static const double baseWidth = 375;
  static const double baseHeight = 812;
  static double baseDiagonal = sqrt(
    baseWidth * baseWidth + baseHeight * baseHeight,
  );

  DisplayFont(this.context);

  TextStyle get twoXL => _getTextStyle(72, FontWeight.bold);
  TextStyle get xL => _getTextStyle(60, FontWeight.bold);
  TextStyle get lg => _getTextStyle(48, FontWeight.bold);
  TextStyle get md => _getTextStyle(36, FontWeight.w600);
  TextStyle get sm => _getTextStyle(30, FontWeight.w500);
  TextStyle get xs => _getTextStyle(24, FontWeight.w500);
  TextStyle get xxs => _getTextStyle(18, FontWeight.w400);
  TextStyle get xxxs => _getTextStyle(14, FontWeight.w400);

  TextStyle _getTextStyle(double fontSize, FontWeight weight) {
    final diagonal = sqrt(
      MediaQuery.of(context).size.height * MediaQuery.of(context).size.height +
          MediaQuery.of(context).size.width * MediaQuery.of(context).size.width,
    );

    final fontSizeFactored = fontSize * (diagonal / baseDiagonal);

    return TextStyle(
      fontFamily: "Pretendard",
      fontWeight: weight,
      fontSize: fontSizeFactored / MediaQuery.of(context).textScaleFactor,
      height: 1.5,
      letterSpacing: 0.2,
    );
  }
}

class TextFont {
  final BuildContext context;
  static const double baseWidth = 375;
  static const double baseHeight = 812;
  static double baseDiagonal = sqrt(
    baseWidth * baseWidth + baseHeight * baseHeight,
  );

  TextFont(this.context);

  TextStyle get xL => _getTextStyle(20, FontWeight.w600);
  TextStyle get lg => _getTextStyle(18, FontWeight.w500);
  TextStyle get md => _getTextStyle(16, FontWeight.w500);
  TextStyle get sm => _getTextStyle(14, FontWeight.w400);
  TextStyle get xs => _getTextStyle(12, FontWeight.w400);
  TextStyle get xxs => _getTextStyle(10, FontWeight.w300);

  TextStyle _getTextStyle(double fontSize, FontWeight weight) {
    final diagonal = sqrt(
      MediaQuery.of(context).size.height * MediaQuery.of(context).size.height +
          MediaQuery.of(context).size.width * MediaQuery.of(context).size.width,
    );

    final fontSizeFactored = fontSize * (diagonal / baseDiagonal);

    return TextStyle(
      fontFamily: "Pretendard",
      fontWeight: weight,
      fontSize: fontSizeFactored / MediaQuery.of(context).textScaleFactor,
      height: 1.5,
      letterSpacing: 0.2,
    );
  }
}
