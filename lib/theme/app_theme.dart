import 'package:lang_bridge/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'extra_colors.dart';

class AppTheme {
  ThemeData _build(Brightness brightness) {
    final themeData = ThemeData(
        useMaterial3: true,
        brightness: brightness,
        extensions: [buildExtraColors()],
        inputDecorationTheme: _buildInputDecorationTheme(brightness),
        colorScheme: _buildColorScheme(brightness),
        filledButtonTheme: _buildFilledButtonTheme(brightness),
        outlinedButtonTheme: _buildOutlinedButtonTheme(brightness),
        textButtonTheme: _buildTextButtonTheme(brightness),
        appBarTheme: _buildAppBarTheme(brightness),
        cardTheme: _buildCardTheme(brightness),
        elevatedButtonTheme: _buildElevatedButtonTheme(brightness),
        fontFamily: 'thuluth');

    return themeData.copyWith(
      textTheme: _buildTextTheme(themeData.textTheme),
    );
  }

  final borderRadius = BorderRadius.circular(BorderSize.extraSmall);
  final padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 14);

  Brightness getBrightness() {
    return currentBrightness.value;
  }

  final currentBrightness = ValueNotifier<Brightness>(Brightness.light);

  ThemeData buildDarkTheme() {
    currentBrightness.value = Brightness.dark;
    return _build(Brightness.dark);
  }

  ThemeData buildLightTheme() {
    currentBrightness.value = Brightness.light;
    return _build(Brightness.light);
  }

  AppBarTheme _buildAppBarTheme(Brightness brightness) {
    return AppBarTheme(
      backgroundColor: brightness == Brightness.dark ? const Color(0xFF1F2937) : Colors.white,
      foregroundColor: brightness == Brightness.dark ? Colors.white : const Color(0xFF1F2937),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  CardThemeData _buildCardTheme(Brightness brightness) {
    return CardThemeData(
      color: brightness == Brightness.dark ? const Color(0xFF374151) : Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme(Brightness brightness) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 55),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 3,
        shadowColor: AppColors.primary.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    OutlineInputBorder buildBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: BorderSize.extraSmallRadius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      hintStyle: TextStyle(
        color: colorScheme.onSurfaceVariant.withOpacity(0.7),
      ),
      filled: true,
      fillColor:
          brightness == Brightness.dark ? const Color(0xFF374151).withOpacity(0.8) : const Color(0xFFF9FAFB),
      activeIndicatorBorder: BorderSide.none,
      border: buildBorder(brightness == Brightness.dark ? const Color(0xFF6B7280) : const Color(0xFFD1D5DB)),
      errorBorder: buildBorder(const Color(0xFFEF4444)),
      enabledBorder:
          buildBorder(brightness == Brightness.dark ? const Color(0xFF6B7280) : const Color(0xFFD1D5DB)),
      focusedBorder: buildBorder(AppColors.primary, width: 2),
      focusedErrorBorder: buildBorder(const Color(0xFFEF4444), width: 2),
      disabledBorder:
          buildBorder(brightness == Brightness.dark ? const Color(0xFF4B5563) : const Color(0xFFE5E7EB)),
    );
  }

  TextTheme _buildTextTheme(TextTheme textTheme) {
    return GoogleFonts.cairoTextTheme(textTheme);
  }

  ExtraColors buildExtraColors() {
    return const ExtraColors(
      success: Color(0xFF58CC02), // Duolingo green
      onSuccess: Colors.white,
      error: Color(0xFFEF4444), // Modern red
    );
  }

  ColorScheme _buildColorScheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return ColorScheme.dark(
        // Using Duolingo-inspired dark theme colors
        primary: AppColors.primary, // Duolingo green
        onPrimary: Colors.white,
        secondary: AppColors.secondary, // Your purple
        onSecondary: Colors.white,
        tertiary: AppColors.accent, // Your cyan
        onTertiary: Colors.white,
        surface: const Color(0xFF1F2937), // Dark gray
        onSurface: const Color(0xFFF9FAFB), // Light gray text
        background: const Color(0xFF111827), // Very dark gray
        onBackground: const Color(0xFFF9FAFB),
        surfaceVariant: const Color(0xFF374151),
        onSurfaceVariant: const Color(0xFFD1D5DB),
        outline: const Color(0xFF6B7280),
        error: const Color(0xFFEF4444),
        onError: Colors.white,
      );
    } else {
      return ColorScheme.light(
        // Using Duolingo-inspired light theme colors
        primary: AppColors.primary, // Duolingo green
        onPrimary: Colors.white,
        secondary: AppColors.secondary, // Your purple
        onSecondary: Colors.white,
        tertiary: AppColors.accent, // Your cyan
        onTertiary: Colors.white,
        surface: Colors.white,
        onSurface: const Color(0xFF1F2937), // Dark gray text
        background: const Color(0xFFF9FAFB), // Very light gray
        onBackground: const Color(0xFF1F2937),
        surfaceVariant: const Color(0xFFF3F4F6),
        onSurfaceVariant: const Color(0xFF6B7280),
        outline: const Color(0xFFD1D5DB),
        error: const Color(0xFFEF4444),
        onError: Colors.white,
      );
    }
  }

  FilledButtonThemeData _buildFilledButtonTheme(Brightness brightness) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 55),
        maximumSize: const Size(double.infinity, double.infinity),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme(Brightness brightness) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: padding,
        minimumSize: const Size(0, 55),
        side: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  TextButtonThemeData _buildTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: padding,
        foregroundColor: brightness == Brightness.dark ? AppColors.primary : AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

final colorSchemeNotifier = ValueNotifier<ColorScheme>(ColorScheme.fromSeed(
  seedColor: AppColors.primary, // Changed to Duolingo green
  brightness: AppTheme().getBrightness(),
));
