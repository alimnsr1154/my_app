import 'dart:ui';

class AppColors {
  static PrimaryColors primaryColors = PrimaryColors();
}

class BaseColors {
  BaseColors();
  Color white = const Color(0xFFFFFFFF);
  Color black = const Color(0xFF000000);
}

class PrimaryColors {
  PrimaryColors();
  BaseColors baseColors = BaseColors();

  Map<int, Color> grey = {
    200: const Color(0xFFE0E0E0),
    300: const Color(0xFFCECECE),
    400: const Color(0xFFBCBCBC),
    500: const Color(0xFFABABAB),
    800: const Color(0xFF757575),
    1000: const Color(0xFF515151),
    1200: const Color(0xFF2E2E2E),
  };
  Color greyColor = const Color(0xFF667085);

  Map<int, Color> primary = {
    50: const Color(0xFFF8F3FE),
    600: const Color(0xFF8130EF),
  };
  Color primaryColor = const Color(0xFF7B66D0);

  Map<int, Color> error = {
    50: const Color(0xFFFDEBEB),
    150: const Color(0xFFEF8030),
  };
  Color errorColor = const Color(0xFFB00020);
}
