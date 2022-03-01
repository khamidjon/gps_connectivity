import 'package:flutter_test/flutter_test.dart';
import 'package:gps_connectivity/gps_connectivity.dart';
import 'package:gps_connectivity/gps_connectivity_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:mockito/mockito.dart';

const bool kCheckConnectivityResult = false;

void main() {
  group('GpsConnectivity', () {
    late GpsConnectivity gpsConnectivity;
    MockConnectivityPlatform fakePlatform;
    setUp(() async {
      fakePlatform = MockConnectivityPlatform();
      GpsConnectivityPlatform.instance = fakePlatform;
      gpsConnectivity = GpsConnectivity();
    });

    test('checkGpsConnectivity', () async {
      final result = await gpsConnectivity.checkGpsConnectivity();
      expect(result, kCheckConnectivityResult);
    });
  });
}

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements GpsConnectivityPlatform {
  @override
  Future<bool> checkGpsConnectivity() async {
    return kCheckConnectivityResult;
  }

  @override
  Stream<bool> get onGpsConnectivityChanged => throw UnimplementedError();
}
