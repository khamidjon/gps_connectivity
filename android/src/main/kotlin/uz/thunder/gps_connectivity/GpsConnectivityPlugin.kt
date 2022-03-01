package uz.thunder.gps_connectivity

import android.content.Context
import android.location.LocationManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel


class GpsConnectivityPlugin: FlutterPlugin {
  private var methodChannel: MethodChannel? = null
  private var eventChannel: EventChannel? = null
  private var receiver: GpsConnectivityBroadcastReceiver? = null

  override fun onAttachedToEngine(binding: FlutterPluginBinding) {
    setupChannels(binding.binaryMessenger, binding.applicationContext)
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
    teardownChannels()
  }

  private fun setupChannels(messenger: BinaryMessenger, context: Context) {
    methodChannel = MethodChannel(messenger, "uz.thunder.gps_connectivity/gps_connectivity")
    eventChannel = EventChannel(messenger, "uz.thunder.gps_connectivity/gps_connectivity_status")
    val locationManager = context.getSystemService(Context.LOCATION_SERVICE) as LocationManager
    val gpsConnectivity = GpsConnectivity(locationManager)
    val methodChannelHandler = ConnectivityMethodChannelHandler(gpsConnectivity)
    receiver = GpsConnectivityBroadcastReceiver(context, gpsConnectivity)
    methodChannel!!.setMethodCallHandler(methodChannelHandler)
    eventChannel!!.setStreamHandler(receiver)
  }

  private fun teardownChannels() {
    methodChannel!!.setMethodCallHandler(null)
    eventChannel!!.setStreamHandler(null)
    receiver!!.onCancel(null)
    methodChannel = null
    eventChannel = null
    receiver = null
  }
}
