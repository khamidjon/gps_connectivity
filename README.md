# gps_connectivity

A Flutter plugin that checks whether GPS is ON or OFF, it can listen for gps change.
Inspired by [connectivity_plus](https://pub.dev/packages/connectivity_plus) plugin

## Platform Support

Only Android for now.

## Usage

Sample usage to check current GPS status:

```dart
import 'package:gps_connectivity/gps_connectivity.dart';

bool isGpsEnabled = await (GpsConnectivity().checkGpsConnectivity());
if (isGpsEnabled) {
  // GPS is ON.
} else {
  // GPS os OFF.
}
```

You can also listen for GPS state changes by subscribing to the stream
exposed by plugin:

```dart
import 'package:gps_connectivity/gps_connectivity.dart';

@override
initState() {
  super.initState();

  subscription = GpsConnectivity().onGpsConnectivityChanged.listen((bool result) {
    // Got a new GPS status!
  });
}

// Be sure to cancel subscription after you are done
@override
dispose() {
  subscription.cancel();
  super.dispose();
}
```
