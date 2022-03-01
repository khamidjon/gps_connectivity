import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import 'gps_connectivity_platform_interface.dart';

class MethodChannelGpsConnectivity extends GpsConnectivityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  MethodChannel methodChannel =
      const MethodChannel('uz.thunder.gps_connectivity/gps_connectivity');

  /// The event channel used to receive ConnectivityResult changes from the native platform.
  @visibleForTesting
  EventChannel eventChannel =
      const EventChannel('uz.thunder.gps_connectivity/gps_connectivity_status');

  Stream<bool>? _onConnectivityChanged;

  /// Fires whenever the connectivity state changes.
  @override
  Stream<bool> get onGpsConnectivityChanged {
    _onConnectivityChanged ??= eventChannel
        .receiveBroadcastStream()
        .map((dynamic result) => result);
    return _onConnectivityChanged!;
  }

  @override
  Future<bool> checkGpsConnectivity() async {
    return methodChannel
        .invokeMethod('check')
        .then<bool>((value) => value);
  }
}
