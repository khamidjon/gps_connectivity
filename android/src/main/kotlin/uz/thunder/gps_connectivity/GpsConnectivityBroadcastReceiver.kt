package uz.thunder.gps_connectivity

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.location.LocationManager
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink


class GpsConnectivityBroadcastReceiver(private val context: Context, private val gpsConnectivity: GpsConnectivity) : BroadcastReceiver(), EventChannel.StreamHandler {

    private var events: EventSink? = null

    override fun onReceive(p0: Context?, p1: Intent?) {
        if (LocationManager.PROVIDERS_CHANGED_ACTION == p1!!.action) {
            events?.success(gpsConnectivity.isGpsEnabled())
        }
    }

    override fun onListen(arguments: Any?, events: EventSink?) {
        this.events = events
        val filter = IntentFilter(LocationManager.PROVIDERS_CHANGED_ACTION)
        filter.addAction(Intent.ACTION_PROVIDER_CHANGED)
        context.registerReceiver(this, filter)
    }

    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(this)
    }
}