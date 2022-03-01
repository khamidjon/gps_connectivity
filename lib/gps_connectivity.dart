import 'dart:async';

import 'gps_connectivity_platform_interface.dart';

class GpsConnectivity {
  GpsConnectivity._();

  static GpsConnectivity? _singleton;

  factory GpsConnectivity() {
    _singleton ??= GpsConnectivity._();
    return _singleton!;
  }

  static GpsConnectivityPlatform get _platform {
    return GpsConnectivityPlatform.instance;
  }

  Stream<bool> get onGpsConnectivityChanged {
    return _platform.onGpsConnectivityChanged;
  }

  Future<bool> checkGpsConnectivity() {
    return _platform.checkGpsConnectivity();
  }
}
