import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gps_connectivity/gps_connectivity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription subscription;
  bool isGpsEnabled = false;

  @override
  void initState() {
    super.initState();
    subscription =
        GpsConnectivity().onGpsConnectivityChanged.listen((bool isGpsEnabled) {
      setState(() {
        this.isGpsEnabled = isGpsEnabled;
      });
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      GpsConnectivity().checkGpsConnectivity().then((bool isGpsEnabled) {
        setState(() {
          this.isGpsEnabled = isGpsEnabled;
        });
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String isOn = isGpsEnabled ? 'ON' : 'OFF';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gps Connectivity Plugin'),
        ),
        body: Center(
          child: Text(
            "Gps is $isOn",
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
