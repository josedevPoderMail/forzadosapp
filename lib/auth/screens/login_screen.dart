import 'package:flutter/material.dart';
import 'package:forzadoapp/auth/models/user_model.dart';
import 'package:forzadoapp/auth/services/auth_service.dart';
import 'package:forzadoapp/auth/services/session_service.dart';
import 'package:forzadoapp/utils/routes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService('https://sntps2jn-3001.brs.devtunnels.ms');

  bool _isLoading = false;

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final loginResponse = await _authService.login(
        _usernameController.text,
        _passwordController.text,
      );

      final token = loginResponse['token'];
      final decodedToken = JwtDecoder.decode(token);
      final email = decodedToken['email'];

      // Obtener datos del usuario
      final userData = await _authService.getUserByEmail(email);
      final isFirstLogin = userData['firstLogin'] == 1;

      // Guardar sesión en SharedPreferences
      // TODO:colocar el usuario
      await SessionService.saveUserSession(UserModel());

      if (isFirstLogin) {
        _showPasswordModal(email);
      } else {
        _navigateToMainScreen(userData['role']);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showPasswordModal(String email) {
    showDialog(
      context: context,
      builder: (context) {
        final _newPasswordController = TextEditingController();

        return AlertDialog(
          title: Text('Actualizar contraseña'),
          content: TextField(
            controller: _newPasswordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Nueva contraseña'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authService.updatePassword(
                    email,
                    _newPasswordController.text,
                  );
                  Navigator.pop(context);
                  _navigateToMainScreen('applicant');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                }
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToMainScreen(String role) {
    if (role == 'applicant') {
      Navigator.pushReplacementNamed(context, AppRoutes.applicantMain);
    } else if (role == 'approver') {
      Navigator.pushReplacementNamed(context, AppRoutes.approverMain);
    } else if (role == 'executor') {
      Navigator.pushReplacementNamed(context, AppRoutes.executorMain);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _handleLogin,
                    child: Text('Iniciar sesión'),
                  ),
          ],
        ),
      ),
    );
  }
}
