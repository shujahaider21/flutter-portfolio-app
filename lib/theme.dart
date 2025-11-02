// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeNotifier {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.dark,
  );

  static void toggle() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

// Dark palette (unchanged)
const Color bgDark = Color(0xFF0A0F16);
const Color cardDark = Color(0xFF0F1720);
const Color electricTeal = Color(0xFF00E5B1);
const Color amberAccent = Color(0xFFFFB454);
const Color softWhite = Color(0xFFF5F7FA);

// Light palette (improved)
const Color lightBg = Color(0xFFF6F9FF); // very soft bluish white
const Color lightCard = Color(0xFFFFFFFF); // pure card
const Color lightPrimary = Color(0xFF0B6FF2); // strong, modern blue
const Color lightSecondary = Color(0xFF00B894); // fresh teal
const Color lightAccent = Color(0xFFFFB454); // warm amber for highlights
const Color lightText = Color(0xFF0B1B2B); // deep charcoal for text

ThemeData buildDarkTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: bgDark,
    primaryColor: electricTeal,
    colorScheme: base.colorScheme.copyWith(secondary: amberAccent),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: softWhite),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: softWhite,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      base.textTheme,
    ).apply(bodyColor: softWhite),
    cardColor: cardDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: electricTeal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

ThemeData buildLightTheme() {
  final base = ThemeData.light();
  final colorScheme = ColorScheme.fromSeed(
    seedColor: lightPrimary,
    primary: lightPrimary,
    secondary: lightSecondary,
    brightness: Brightness.light,
  );

  return base.copyWith(
    scaffoldBackgroundColor: lightBg,
    primaryColor: lightPrimary,
    colorScheme: colorScheme.copyWith(secondary: lightSecondary),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBg,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: lightText),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: lightText,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      base.textTheme,
    ).apply(bodyColor: lightText),
    cardColor: lightCard,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: lightPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    shadowColor: lightPrimary.withOpacity(0.08),
  );
}
