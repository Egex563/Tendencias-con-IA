// lib/utils/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF1976D2); // Azul oscuro principal
  static const Color secondaryBlue = Color(0xFF64B5F6); // Azul más claro para acentos
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFEEEEEE);
  static const Color darkGray = Color(0xFF424242);
  static const Color errorRed = Color(0xFFD32F2F); // Para mensajes de error

  // Para primarySwatch, si quieres usarlo
  static const MaterialColor primaryBlueSwatch = MaterialColor(
    0xFF1976D2,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2), // Nuestro primaryBlue
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}