import 'package:flutter/material.dart';
import 'package:forzadoapp/auth/screens/login_screen.dart';
import 'package:forzadoapp/onboarding/onboarding_screen.dart';

// Definir todas las rutas nombradas
import 'package:forzadoapp/onboarding/splash_screen.dart';
import 'package:forzadoapp/screens/applicant/applicant_main_screen.dart';
import 'package:forzadoapp/screens/approver/approver_main_screen.dart';
import 'package:forzadoapp/screens/executor/executor_main_screen.dart';
import 'package:forzadoapp/screens/main/main_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String main = '/main';
  static const String approverMain = '/approver/main';
  static const String applicantOnlineMain = '/applicant/online/main';
  static const String altaForzadoOnline = '/applicant/online/alta-forzado';
  static const String bajaForzadoOnline = '/applicant/online/baja-forzado';
  static const String listaForzadosOnline = '/applicant/online/lista-forzados';
  static const String actualizarForzadoOnline = '/applicant/online/actualizar-forzado';
  static const String formularioOnline = '/applicant/online/formulario';
  static const String listaAltaOfflineOnline = '/applicant/online/lista-alta-offline';
  static const String listaBajaOfflineOnline = '/applicant/online/lista-baja-offline';
  static const String altaForzadoOffline = '/applicant/offline/alta-forzado';
  static const String bajaForzadoOffline = '/applicant/offline/baja-forzado';
  static const String listaAltasOffline = '/applicant/offline/lista-altas';
  static const String listaBajasOffline = '/applicant/offline/lista-bajas';
  static const String executorMain = '/executor/main';

  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => OnboardingScreen(),
    login: (context) => LoginScreen(),
    // register: (context) => RegisterScreen(),
    // forgotPassword: (context) => ForgotPasswordScreen(),
    main: (context) => MainScreen(),
    approverMain: (context) => ApproverMainScreen(),
    applicantOnlineMain: (context) => ApplicantMainScreen(),
    // altaForzadoOnline: (context) => AltaForzadoScreen(),
    // bajaForzadoOnline: (context) => BajaForzadoScreen(),
    // listaForzadosOnline: (context) => ListaForzadosScreen(),
    // actualizarForzadoOnline: (context) => ActualizarForzadoScreen(),
    // formularioOnline: (context) => FormularioScreen(),
    // listaAltaOfflineOnline: (context) => ListaAltaOfflineScreen(),
    // listaBajaOfflineOnline: (context) => ListaBajaOfflineScreen(),
    // altaForzadoOffline: (context) => AltaForzadoOfflineScreen(),
    // bajaForzadoOffline: (context) => BajaForzadoOfflineScreen(),
    // listaAltasOffline: (context) => ListaAltasScreen(),
    // listaBajasOffline: (context) => ListaBajasScreen(),
    executorMain: (context) => ExecutorMainScreen(),
  };
}
