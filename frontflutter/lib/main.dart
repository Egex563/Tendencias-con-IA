// lib/main.dart
import 'package:flutter/material.dart';
import 'package:mi_proyecto_registro/screens/register_screen.dart';
import 'package:mi_proyecto_registro/utils/app_colors.dart'; // Importa tus colores

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Usuarios',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryBlueSwatch, // Usar un MaterialColor
        primaryColor: AppColors.primaryBlue,
        hintColor: AppColors.secondaryBlue,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white, // Color del texto y íconos en el AppBar
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryBlue,
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColors.primaryBlue, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          labelStyle: TextStyle(color: AppColors.darkGray),
          hintStyle: TextStyle(color: AppColors.lightGray),
        ),
      ),
      home: const RegisterScreen(), // O LoginScreen
    );
  }
}