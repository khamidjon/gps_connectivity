package uz.thunder.gps_connectivity

import android.location.LocationManager


class GpsConnectivity(private val locationManager: LocationManager) {

    fun isGpsEnabled(): Boolean {
        return locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
    }
}