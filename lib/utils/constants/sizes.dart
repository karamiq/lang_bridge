import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  // static const Color primary = Color(0xFF6366F1);
  static const Color primary = Colors.blueAccent;

  // static const Color secondary = Color(0xFF8B5CF6);
  static const Color secondary = Colors.purpleAccent;
  // static const Color accent = Color(0xFF06B6D4);
  static const Color accent = Colors.cyanAccent;

  static const Color background = Colors.white;

  static const Color stars = Colors.yellow;
  static const Color achivement = Colors.orangeAccent;

  static const Color fire = Color.fromARGB(255, 253, 0, 0);

  static const primaryGradient = LinearGradient(
    colors: [primary, secondary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const secondaryGradient = LinearGradient(
    colors: [secondary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const backgroundGradient = LinearGradient(
    colors: [Colors.white],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class IconSize {
  const IconSize._();

  static const double extraSmall = 8.0;
  static const double small = 16.0;
  static const double medium = 24.0;
  static const double large = 32.0;
  static const double extraLarge = 48.0;
}

class BorderSize {
  const BorderSize._();

  static const double none = 0;
  static const double xxs = 4.0;
  static const double extraSmall = 8.0;
  static const double small = 16.0;
  static const double medium = 24.0;
  static const double large = 32.0;
  static const double extraLarge = 48.0;
  static const double full = 100.0;

  static const BorderRadius noneRadius = BorderRadius.all(Radius.circular(none));
  static const BorderRadius xxsRadius = BorderRadius.all(Radius.circular(xxs));
  static const BorderRadius extraSmallRadius = BorderRadius.all(Radius.circular(extraSmall));
  static const BorderRadius smallRadius = BorderRadius.all(Radius.circular(small));
  static const BorderRadius mediumRadius = BorderRadius.all(Radius.circular(medium));
  static const BorderRadius largeRadius = BorderRadius.all(Radius.circular(large));
  static const BorderRadius extraLargeRadius = BorderRadius.all(Radius.circular(extraLarge));
  static const BorderRadius fullRadius = BorderRadius.all(Radius.circular(full));
}

class Insets {
  const Insets._();

  static const double none = 0.0;
  static const double extraSmall = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;

  static const EdgeInsets noneAll = EdgeInsets.all(none);
  static const EdgeInsets extraSmallAll = EdgeInsets.all(extraSmall);
  static const EdgeInsets smallAll = EdgeInsets.all(small);
  static const EdgeInsets mediumAll = EdgeInsets.all(medium);
  static const EdgeInsets largeAll = EdgeInsets.all(large);
  static const EdgeInsets extraLargeAll = EdgeInsets.all(extraLarge);
}

class BorderWidth {
  const BorderWidth._();

  static const double none = 0.0;
  static const double extraSmall = 1.0;
  static const double small = 2.0;
  static const double medium = 4.0;
  static const double large = 8.0;
  static const double extraLarge = 16.0;
}

class Time {
  const Time._();

  static const Duration none = Duration.zero;
  static const Duration extraSmall = Duration(milliseconds: 100);
  static const Duration small = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 500);
  static const Duration large = Duration(milliseconds: 700);
  static const Duration extraLarge = Duration(seconds: 1);
}
