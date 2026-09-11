import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF0A0E21); // Deep navy
  static const Color darkSurface = Color(0xFF1C1F33); // Slightly lighter surface
// static const Color darkBackground = Color(0xFF0F172A);
// static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkPrimary = Color(0xFF38BDF8); // Vibrant Blue
  static const Color darkSecondary = Color(0xFF818CF8); // Indigo
  static const Color darkText = Color(0xFFF8FAFC);
  static const Color darkTextMuted = Color(0xFF94A3B8);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF0284C7); // Deep Blue
  static const Color lightSecondary = Color(0xFF4F46E5); // Indigo
  static const Color lightText = Color(0xFF0F172A);
  static const Color lightTextMuted = Color(0xFF475569);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: darkPrimary,
      colorScheme: const ColorScheme.dark(
        primary: darkPrimary,
        secondary: darkSecondary,
        surface: darkSurface,
        background: darkBackground,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.poppins(
              color: darkText,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: GoogleFonts.poppins(
              color: darkText,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: GoogleFonts.poppins(
              color: darkText,
              fontWeight: FontWeight.w600,
            ),
            headlineMedium: GoogleFonts.poppins(
              color: darkText,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: GoogleFonts.poppins(color: darkText, fontSize: 16),
            bodyMedium: GoogleFonts.poppins(color: darkTextMuted, fontSize: 14),
          ),
      cardColor: darkSurface,
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      primaryColor: lightPrimary,
      colorScheme: const ColorScheme.light(
        primary: lightPrimary,
        secondary: lightSecondary,
        surface: lightSurface,
        background: lightBackground,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.poppins(
              color: lightText,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: GoogleFonts.poppins(
              color: lightText,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: GoogleFonts.poppins(
              color: lightText,
              fontWeight: FontWeight.w600,
            ),
            headlineMedium: GoogleFonts.poppins(
              color: lightText,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: const TextStyle(color: lightText, fontSize: 16),
            bodyMedium: const TextStyle(color: lightTextMuted, fontSize: 14),
          ),
      cardColor: lightSurface,
      useMaterial3: true,
    );
  }
}
