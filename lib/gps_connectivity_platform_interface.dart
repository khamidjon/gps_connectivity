import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_gps_connectivity.dart';

abstract class GpsConnectivityPlatform extends PlatformInterface {
  /// Constructs a ConnectivityPlatform.
  GpsConnectivityPlatform() : super(token: _token);

  static final Object _token = Object();

  static GpsConnectivityPlatform _instance = MethodChannelGpsConnectivity();

  /// The default instance of [GpsConnectivityPlatform] to use.
  ///
  /// Defaults to [MethodChannelConnectivity].
  static GpsConnectivityPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [GpsConnectivityPlatform] when they register themselves.
  static set instance(GpsConnectivityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Checks the connection status of the device.
  Future<bool> checkGpsConnectivity() {
    throw UnimplementedError('checkConnectivity() has not been implemented.');
  }

  /// Returns a Stream of ConnectivityResults changes.
  Stream<bool> get onGpsConnectivityChanged {
    throw UnimplementedError('get onConnectivityChanged has not been implemented.');
  }
}
