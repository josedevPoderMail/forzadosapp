import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final String baseUrl;

  AuthService(this.baseUrl);

  /// Inicia sesión con usuario y contraseña
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/api/mobile/auth');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Devuelve el token
    } else {
      throw Exception('Error al iniciar sesión: ${response.body}');
    }
  }

  /// Obtiene datos del usuario por correo
  Future<Map<String, dynamic>> getUserByEmail(String email) async {
    final url = Uri.parse('$baseUrl/api/usuarios/por-correo?email=$email');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Devuelve el objeto del usuario
    } else {
      throw Exception('Error al obtener datos del usuario: ${response.body}');
    }
  }

  /// Actualiza la contraseña del usuario
  Future<void> updatePassword(String id, String newPassword) async {
    final url = Uri.parse('$baseUrl/api/usuarios/reiniciar-contrasena');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'password': newPassword}),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar contraseña: ${response.body}');
    }
  }
}
