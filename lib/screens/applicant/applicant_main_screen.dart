import 'package:flutter/material.dart';
import 'package:forzadoapp/utils/routes.dart';
import 'package:forzadoapp/utils/helpers/connectivity_helper.dart';

class ApplicantMainScreen extends StatefulWidget {
  @override
  _ApplicantMainScreenState createState() => _ApplicantMainScreenState();
}

class _ApplicantMainScreenState extends State<ApplicantMainScreen> {
  bool? _hasInternet;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  /// Verifica la conexión a internet y navega a la pantalla adecuada.
  Future<void> _checkInternetConnection() async {
    bool hasInternet = await ConnectivityHelper.hasInternetConnection();
    setState(() {
      _hasInternet = hasInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasInternet == null) {
      // Mostrar un indicador de carga mientras se verifica la conexión
      return const  Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Navegación condicional según la conexión a internet
    return _hasInternet == true ? _buildOnlineScreen() : _buildOfflineScreen();
  }

  Widget _buildOnlineScreen() {
    return Scaffold(
      appBar: AppBar(title: Text("Applicant - Online")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.altaForzadoOnline);
              },
              child: Text("Alta Forzado"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.bajaForzadoOnline);
              },
              child: Text("Baja Forzado"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listaForzadosOnline);
              },
              child: Text("Lista Forzados"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineScreen() {
    return Scaffold(
      appBar: AppBar(title: Text("Applicant - Offline")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.altaForzadoOffline);
              },
              child: Text("Alta Forzado Offline"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.bajaForzadoOffline);
              },
              child: Text("Baja Forzado Offline"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listaAltasOffline);
              },
              child: Text("Lista de Altas Offline"),
            ),
          ],
        ),
      ),
    );
  }
}
