import 'package:flutter/material.dart';
import 'package:forzadoapp/utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forzados',
      initialRoute: AppRoutes.splash, // Ruta inicial
      routes: AppRoutes.routes,   
    );
  }
}