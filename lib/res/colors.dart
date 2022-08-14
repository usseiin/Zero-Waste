import 'package:flutter/material.dart';

class AppColors {
  final Map<int, Color> _primarySwatch = {
    50: const Color.fromRGBO(10, 157, 86, 0.1),
    100: const Color.fromRGBO(10, 157, 86, 0.2),
    200: const Color.fromRGBO(10, 157, 86, 0.3),
    300: const Color.fromRGBO(10, 157, 86, 0.4),
    400: const Color.fromRGBO(10, 157, 86, 0.5),
    500: const Color.fromRGBO(10, 157, 86, 0.6),
    600: const Color.fromRGBO(10, 157, 86, 0.7),
    700: const Color.fromRGBO(10, 157, 86, 0.8),
    800: const Color.fromRGBO(10, 157, 86, 0.9),
    900: const Color.fromRGBO(10, 157, 86, 1.0),
  };

  MaterialColor get appColor => MaterialColor(0xFF0A9D56, _primarySwatch);

  Color get primaryColor => const Color(0xFF0A9D56);

  Color get black => const Color(0xFF000000);

  Color get white => const Color(0xFFFFFFFF);

  //Onboard
  Color get subTitle => const Color(0xFF222222);
  //Text field hint
  Color get tField => const Color(0xFF979797);
  //Farmer Type
  Color get type => const Color(0xFF808080);
  Color get beforeType => const Color(0xFF404040);
  //Auth color
  Color get logIn => const Color(0xFF4D4D4D);
}