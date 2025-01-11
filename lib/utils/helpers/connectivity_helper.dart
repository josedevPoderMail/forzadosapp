import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  /// Verifica si hay conexión a internet.
  static Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet
        );
  }
}
