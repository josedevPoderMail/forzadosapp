import 'package:flutter/material.dart';
import 'package:forzadoapp/auth/services/session_service.dart';
import 'package:forzadoapp/utils/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _initializeApp(context);
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  void _initializeApp(BuildContext context) async {
    bool isLoggedIn = await SessionService.isLoggedIn();
    int? userRole = await SessionService.getUserRole();

    if (!isLoggedIn) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      switch (userRole) {
        case 1:
        case 5:
          Navigator.pushReplacementNamed(context, AppRoutes.applicantMain);
          break;
        case 2:
        case 6:
          Navigator.pushReplacementNamed(context, AppRoutes.approverMain);
          break;
        case 3:
        case 7:
          Navigator.pushReplacementNamed(context, AppRoutes.executorMain);
          break;
        default:
          Navigator.pushReplacementNamed(context, AppRoutes.main);
      }
    }
  }
}
