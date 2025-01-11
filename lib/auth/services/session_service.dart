import 'package:forzadoapp/auth/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String _keyIsLoggedIn = "is_logged_in";
  static const String _keyUserRole = "user_role";
  static const String _keyUserName = "user_name";

  /// Guarda los datos del usuario.
  static Future<void> saveUserSession(UserModel user) async {
   
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setInt(_keyUserRole, user.getHighestRole(user));
    await prefs.setString(_keyUserName, user.nombre ?? 'Sin nombre');
  }

  /// Obtiene el rol del usuario.
  static Future<int?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyUserRole);
  }

  /// Obtiene el nombre del usuario.
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserName);
  }

  /// Verifica si el usuario ya inició sesión.
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  /// Limpia la sesión del usuario.
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
