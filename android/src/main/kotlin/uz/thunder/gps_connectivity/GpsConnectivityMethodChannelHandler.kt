package uz.thunder.gps_connectivity

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


internal class ConnectivityMethodChannelHandler(private val gpsConnectivity: GpsConnectivity) : MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if ("check" == call.method) {
            result.success(gpsConnectivity.isGpsEnabled())
        } else {
            result.notImplemented()
        }
    }
}