import 'enums.dart';

/// Convert a String to a GpsConnectivityResult value.
GpsConnectivityResult parseGpsConnectivityResult(String state) {
  switch (state) {
    case 'gps':
      return GpsConnectivityResult.gps;
    case 'none':
    default:
      return GpsConnectivityResult.none;
  }
}
