import 'package:flutter/material.dart';
import 'package:forzadoapp/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  bool? hasAcceptedOnboarding;
  bool? isUserLoggedIn;
  int? userRole;
  String? nextPage;

  Future<void> loadInitialData() async {
    final prefs = await SharedPreferences.getInstance();

    // Obtener valores guardados en SharedPreferences
    hasAcceptedOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
    userRole = prefs.getInt('userRole');

    // Determinar la próxima página
    nextPage = _determineNextPage();
    notifyListeners();
  }

  String _determineNextPage() {
    if (hasAcceptedOnboarding == true) {
      return isUserLoggedIn == true
          ? _navigateHandleRole(userRole ?? 10)
          : AppRoutes.login;
    } else {
      return AppRoutes.onboarding;
    }
  }

  String _navigateHandleRole(int role) {
    switch (role) {
      case 3:
      case 7:
        return AppRoutes.executorMain; // Ruta para executor
      case 2:
      case 6:
        return AppRoutes.approverMain; // Ruta para approver
      case 5:
      case 1:
        return AppRoutes.main; // Ruta para applicant
      default:
        return AppRoutes.login;
    }
  }
}
