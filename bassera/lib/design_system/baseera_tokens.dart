import 'package:flutter/material.dart';

/// Spacing scale used across Baseera screens and components.
abstract final class BaseeraSpacing {
  static const double xxs = 2;
  static const double xs = 6;
  static const double sm = 10;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Corner radii aligned with Material 3 shapes.
abstract final class BaseeraRadii {
  static const double sm = 10;
  static const double md = 14;
  static const double lg = 20;
  static const double xl = 24;
  static const BorderRadius card =
      BorderRadius.all(Radius.circular(md));
}

/// Semantic colors aligned with [Subsilo](https://subsilo.app/) (Tailwind tokens
/// from their production CSS: primary, accent, surfaces, and typography).
abstract final class BaseeraBrand {
  static const Color primary = Color(0xFF8E5EC6);
  static const Color accent = Color(0xFFE96CF3);

  static const Color backgroundLight = Color(0xFFF9F5F7);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color mutedLight = Color(0xFFF3F4F6);
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color textLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);

  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardDark = Color(0xFF1E1B26);
  static const Color mutedDark = Color(0xFF14171D);
  static const Color borderDark = Color(0xFF2A2A2A);
  static const Color textDark = Color(0xFFECECEC);
  static const Color textSecondaryDark = Color(0xFFA8A8A8);
  static const Color primaryDark = Color(0xFFB785EE);
}
