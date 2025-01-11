import 'package:flutter/material.dart';
import 'package:forzadoapp/auth/screens/login_screen.dart';
import 'package:forzadoapp/onboarding/onboarding_screen.dart';
// Definir todas las rutas nombradas
import 'package:forzadoapp/onboarding/splash_screen.dart';
import 'package:forzadoapp/screens/applicant/applicant_main_screen.dart';
import 'package:forzadoapp/screens/applicant/offline/main_screen.dart';
import 'package:forzadoapp/screens/applicant/online/alta_forzado_screen.dart';
import 'package:forzadoapp/screens/applicant/online/baja_forzado_screen.dart';
import 'package:forzadoapp/screens/applicant/online/lista_forzados_screen.dart';
import 'package:forzadoapp/screens/applicant/online/main_screen.dart';
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
  
  // 
  static const String applicantMainOn  ='/applicant/main-on';
  static const String altaForzadoOnline = '/applicant/online/alta-forzado';
  static const String bajaForzadoOnline = '/applicant/online/baja-forzado';
  static const String listaForzadosOnline = '/applicant/online/lista-forzados';
  static const String listaAltaOfflineOnline = '/applicant/online/lista-alta-offline';
  static const String listaBajaOfflineOnline = '/applicant/online/lista-baja-offline';
  // 
static const String  applicantMainOff = '/applicant/main-off';
  static const String altaForzadoOffline = '/applicant/offline/alta-forzado';
  static const String bajaForzadoOffline = '/applicant/offline/baja-forzado';
  static const String listaAltasOffline = '/applicant/offline/lista-altas';
  static const String listaBajasOffline = '/applicant/offline/lista-bajas';
// 
  static const String applicantMain = '/applicant/main';
  static const String executorMain = '/executor/main';
  static const String approverMain = '/approver/main';

  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => OnboardingScreen(),
    login: (context) =>   LoginScreen(),
// Pantalla para rol de aplicante con conexion a internet
    main: (context) => const MainScreen(),
    applicantMain: (context) => ApplicantMainScreen(),
    applicantMainOn: (context) => const MainScreenOn(),
    altaForzadoOnline: (context) => const AltaForzadoScreen(),
    bajaForzadoOnline: (context) => const BajaForzadoScreen(),
    listaForzadosOnline: (context) => const ListaForzadosScreen(),
    // formularioOnline: (context) => FormularioScreen(),
    
    // actualizarForzadoOnline: (context) => ActualizarForzadoScreen(),

    
    applicantMainOff: (context) => MainScreenOff(),
    // altaForzadoOffline: (context) => AltaForzadoOfflineScreen(),
    // bajaForzadoOffline: (context) => BajaForzadoOfflineScreen(),
    // listaAltaOfflineOnline: (context) => ListaAltaOfflineScreen(),
    // listaBajaOfflineOnline: (context) => ListaBajaOfflineScreen(),
    // listaAltasOffline: (context) => ListaAltasScreen(),
    // listaBajasOffline: (context) => ListaBajasScreen(),

    approverMain: (context) => ApproverMainScreen(),
    executorMain: (context) => ExecutorMainScreen(),
  };
}
