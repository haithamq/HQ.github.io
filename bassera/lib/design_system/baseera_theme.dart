import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Baseera theme: typography and color roles aligned with
/// [Subsilo](https://subsilo.app/) (Baloo Bhaijaan 2, purple / magenta accent,
/// warm light shell and deep violet-tinted dark surfaces).
abstract final class BaseeraTheme {
  static ThemeData light([ColorScheme? dynamicScheme]) {
    final ColorScheme scheme = dynamicScheme ?? _lightScheme;
    return _build(
      scheme: scheme,
      scaffoldBackground: BaseeraBrand.backgroundLight,
      brightness: Brightness.light,
    );
  }

  static ThemeData dark([ColorScheme? dynamicScheme]) {
    final ColorScheme scheme = dynamicScheme ?? _darkScheme;
    return _build(
      scheme: scheme,
      scaffoldBackground: BaseeraBrand.backgroundDark,
      brightness: Brightness.dark,
    );
  }

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: BaseeraBrand.primary,
    brightness: Brightness.light,
  ).copyWith(
    primary: BaseeraBrand.primary,
    onPrimary: Colors.white,
    secondary: BaseeraBrand.accent,
    onSecondary: const Color(0xFF1A0A1C),
    surface: BaseeraBrand.cardLight,
    onSurface: BaseeraBrand.textLight,
    onSurfaceVariant: BaseeraBrand.textSecondaryLight,
    outline: BaseeraBrand.borderLight,
    outlineVariant: const Color(0xFFEEEEEE),
    primaryContainer: const Color(0xFFEDE4F7),
    onPrimaryContainer: const Color(0xFF2D1F4A),
    secondaryContainer: const Color(0xFFFCE4FC),
    onSecondaryContainer: const Color(0xFF57145E),
    surfaceContainerHighest: BaseeraBrand.mutedLight,
    surfaceContainerHigh: const Color(0xFFFAFAFA),
    surfaceContainer: BaseeraBrand.cardLight,
    surfaceContainerLow: BaseeraBrand.cardLight,
    surfaceContainerLowest: BaseeraBrand.backgroundLight,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: BaseeraBrand.primaryDark,
    brightness: Brightness.dark,
  ).copyWith(
    primary: BaseeraBrand.primaryDark,
    onPrimary: const Color(0xFF1E1528),
    secondary: BaseeraBrand.accent,
    onSecondary: const Color(0xFF1A0A1C),
    surface: BaseeraBrand.cardDark,
    onSurface: BaseeraBrand.textDark,
    onSurfaceVariant: BaseeraBrand.textSecondaryDark,
    outline: BaseeraBrand.borderDark,
    outlineVariant: const Color(0xFF3D3A45),
    primaryContainer: const Color(0xFF4A3D5C),
    onPrimaryContainer: const Color(0xFFE8DAF7),
    secondaryContainer: const Color(0xFF5C3862),
    onSecondaryContainer: const Color(0xFFFBD5FC),
    surfaceContainerHighest: const Color(0xFF2A2633),
    surfaceContainerHigh: const Color(0xFF25212E),
    surfaceContainer: BaseeraBrand.cardDark,
    surfaceContainerLow: BaseeraBrand.cardDark,
    surfaceContainerLowest: BaseeraBrand.backgroundDark,
    scrim: Colors.black54,
  );

  static ThemeData _build({
    required ColorScheme scheme,
    required Color scaffoldBackground,
    required Brightness brightness,
  }) {
    final TextTheme textTheme = GoogleFonts.balooBhaijaan2TextTheme()
        .apply(
          bodyColor: scheme.onSurface,
          displayColor: scheme.onSurface,
        )
        .copyWith(
          headlineSmall: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.2,
            color: scheme.onSurface,
          ),
          titleLarge: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 1.25,
            letterSpacing: -0.2,
            color: scheme.onSurface,
          ),
          titleMedium: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1.3,
            color: scheme.onSurface,
          ),
          bodyLarge: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.4,
            color: scheme.onSurface,
          ),
          bodyMedium: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 1.4,
            color: scheme.onSurface,
          ),
          bodySmall: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 1.35,
            color: scheme.onSurfaceVariant,
          ),
          labelLarge: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.2,
            color: scheme.onSurface,
          ),
          labelMedium: GoogleFonts.balooBhaijaan2(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1.2,
            color: scheme.onSurfaceVariant,
          ),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: scaffoldBackground,
        foregroundColor: scheme.onSurface,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BaseeraRadii.card),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brightness == Brightness.light
            ? BaseeraBrand.mutedLight
            : BaseeraBrand.mutedDark,
        border: OutlineInputBorder(borderRadius: BaseeraRadii.card),
        enabledBorder: OutlineInputBorder(
          borderRadius: BaseeraRadii.card,
          borderSide: BorderSide(color: scheme.outline.withOpacity(0.85)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BaseeraRadii.card,
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          elevation: 0,
          shadowColor: BaseeraBrand.accent.withOpacity(0.45),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        focusElevation: 4,
        hoverElevation: 4,
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        extendedTextStyle: GoogleFonts.balooBhaijaan2(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}
