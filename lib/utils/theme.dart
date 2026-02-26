import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryColor = Color(0xFF444fc0);
  static const Color primaryLight = Color(0xFF6B75D0);
  static const Color primaryDark = Color(0xFF2E378A);

  // Background Colors
  static const Color lightBackground = Color(0xFFF2F4FC);
  static const Color darkBackground = Color(0xFF1A1A2E);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF252542);

  // Neutral Colors
  static const Color grey1 = Color(0xFFF6F6F6);
  static const Color grey2 = Color(0xFFE7E7E7);
  static const Color grey3 = Color(0xFFBDBDBD);
  static const Color grey4 = Color(0xFF828282);
  static const Color grey5 = Color(0xFF4F4F4F);

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFFBDBDBD);

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: primaryLight,
        surface: cardLight,
        error: error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimaryLight,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: lightBackground,
      textTheme: _buildTextTheme(Brightness.light),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: lightBackground,
        iconTheme: const IconThemeData(color: textPrimaryLight),
        titleTextStyle: GoogleFonts.mulish(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textPrimaryLight,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.mulish(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: grey1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: GoogleFonts.mulish(fontSize: 14, color: grey4),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: cardLight,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardLight,
        selectedItemColor: primaryColor,
        unselectedItemColor: grey4,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: GoogleFonts.mulish(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.mulish(fontSize: 12),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: grey1,
        selectedColor: primaryColor,
        labelStyle: GoogleFonts.mulish(fontSize: 14),
        secondaryLabelStyle: GoogleFonts.mulish(
          fontSize: 14,
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryLight,
        surface: cardDark,
        error: error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimaryDark,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: darkBackground,
      textTheme: _buildTextTheme(Brightness.dark),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: darkBackground,
        iconTheme: const IconThemeData(color: textPrimaryDark),
        titleTextStyle: GoogleFonts.mulish(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textPrimaryDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryLight,
          side: const BorderSide(color: primaryLight, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: GoogleFonts.mulish(fontSize: 14, color: grey4),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: cardDark,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardDark,
        selectedItemColor: primaryLight,
        unselectedItemColor: grey4,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: GoogleFonts.mulish(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.mulish(fontSize: 12),
      ),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final color = brightness == Brightness.light
        ? textPrimaryLight
        : textPrimaryDark;
    final secondaryColor = brightness == Brightness.light
        ? textSecondaryLight
        : textSecondaryDark;

    return TextTheme(
      displayLarge: GoogleFonts.mulish(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      displayMedium: GoogleFonts.mulish(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      displaySmall: GoogleFonts.mulish(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headlineLarge: GoogleFonts.mulish(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      headlineMedium: GoogleFonts.mulish(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: GoogleFonts.mulish(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleLarge: GoogleFonts.mulish(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleMedium: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleSmall: GoogleFonts.mulish(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyLarge: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: GoogleFonts.mulish(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: GoogleFonts.mulish(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),
      labelLarge: GoogleFonts.mulish(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelMedium: GoogleFonts.mulish(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelSmall: GoogleFonts.mulish(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: secondaryColor,
      ),
    );
  }
}
