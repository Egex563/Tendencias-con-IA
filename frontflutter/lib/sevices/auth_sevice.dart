// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://localhost:3000/api/auth'; // Cambia esto por la URL de tu backend

  Future<void> registerUser(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Registro exitoso
      print('Usuario registrado exitosamente');
    } else {
      // Error en el registro
      final errorData = json.decode(response.body);
      throw Exception(errorData['message'] ?? 'Fallo el registro');
    }
  }

  Future<String> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token']; // Retorna el token de autenticación
    } else {
      final errorData = json.decode(response.body);
      throw Exception(errorData['message'] ?? 'Fallo el inicio de sesión');
    }
  }
}