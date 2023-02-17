package com.paulokeller.findmyphone

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.google.firebase.database.*
import java.lang.Exception

class MapsActivity : AppCompatActivity(), OnMapReadyCallback {

    private lateinit var mMap: GoogleMap
    var dataBaseRef: DatabaseReference? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_maps)

        val bundle: Bundle? = intent.extras
        val phoneNumber = bundle!!.getString("phoneNumber")
        dataBaseRef = FirebaseDatabase.getInstance().reference

        dataBaseRef!!.child("Users").child(phoneNumber!!).child("location").addValueEventListener(object : ValueEventListener {
            override fun onCancelled(p0: DatabaseError) {
            }

            override fun onDataChange(snapshot: DataSnapshot) {
                try {
                    val td = snapshot.value!! as HashMap<String, Any>
                    val lat = td["lat"].toString()
                    val log = td["log"].toString()
                    MapsActivity.sydney = LatLng(lat.toDouble(), log.toDouble())
                    val lastOnline = td["lastOnline"].toString()
                    MapsActivity.lastOnline = lastOnline
                } catch (ex: Exception) {

                }

            }
        })
    }

    fun loadMap() {
        val mapFragment = supportFragmentManager
            .findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    companion object {
        var sydney = LatLng(-34.0, 151.0)
        var lastOnline = "not defined"
    }

    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap

        // Add a marker in Sydney and move the camera

        mMap.addMarker(MarkerOptions().position(sydney).title(lastOnline))
        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney))
    }
}
