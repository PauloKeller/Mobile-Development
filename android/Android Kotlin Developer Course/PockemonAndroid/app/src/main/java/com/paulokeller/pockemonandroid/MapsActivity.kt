package com.paulokeller.pockemonandroid

import android.content.Context
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.core.app.ActivityCompat

import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import java.lang.Exception

class MapsActivity : AppCompatActivity(), OnMapReadyCallback {
    private lateinit var mMap: GoogleMap
    private val accessLocation = 123
    var location: Location? = null
    var oldLocation: Location? = null
    val pokemons = ArrayList<Pokemon>()
    var playerPower = 0.0

    fun loadPokemons() {
        pokemons.add(
            Pokemon(
                R.drawable.charmander,
                "Charmander",
                "Here us from japan",
                55.0,
                37.778994893035,
                -122.401846637263
            )
        )
        pokemons.add(
            Pokemon(
                R.drawable.bulbasaur,
                "Bulbasaur",
                "Bulbasaur living in usa",
                90.5,
                37.7949568502667,
                -122.410494089127
            )
        )
        pokemons.add(
            Pokemon(
                R.drawable.squirtle,
                "Squirtle",
                "Squirtle living in iraq",
                33.5,
                37.7816621152613,
                -122.41225361824
            )
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_maps)
        val mapFragment = supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)

        checkPermission()
        loadPokemons()
    }


    private fun checkPermission() {

        if (Build.VERSION.SDK_INT >= 23) {
            if (ActivityCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.ACCESS_FINE_LOCATION
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                requestPermissions(
                    arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION),
                    accessLocation
                )
                return
            }
        }

        getUserLocation()
    }

    private fun getUserLocation() {
        Toast.makeText(this, "User location access on", Toast.LENGTH_LONG).show()
        //TODO: Will implement later

        val myLocation = MyLocationListener()
        val locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager

        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 3, 3f, myLocation)
        val myThread = MyThread()
        myThread.start()
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        when (requestCode) {
            accessLocation -> {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    getUserLocation()
                } else {
                    Toast.makeText(this, "We cannot access to your location", Toast.LENGTH_LONG)
                        .show()
                }
            }
        }

        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap


    }

    inner class MyLocationListener : LocationListener {


        init {
            location = Location("Start")
            location!!.longitude = 0.0
            location!!.longitude = 0.0
        }

        override fun onLocationChanged(p0: Location?) {
            location = p0
        }

        override fun onStatusChanged(p0: String?, p1: Int, p2: Bundle?) {
//            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        }

        override fun onProviderEnabled(p0: String?) {
//            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        }

        override fun onProviderDisabled(p0: String?) {
//            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        }
    }

    inner class MyThread : Thread() {
        init {
            oldLocation = Location("Start")
            oldLocation!!.longitude = 0.0
            oldLocation!!.longitude = 0.0
        }

        override fun run() {
            while (true) {
                try {
                    if (oldLocation!!.distanceTo(location) == 0f) {
                        continue
                    }

                    oldLocation = location

                    runOnUiThread {
                        mMap.clear()
                        val sydney = LatLng(location!!.latitude, location!!.longitude)
                        mMap.addMarker(
                            MarkerOptions()
                                .position(sydney).title("Me")
                                .snippet(" here is my location")
                                .icon(
                                    BitmapDescriptorFactory
                                        .fromResource(R.drawable.mario)
                                )
                        )
                        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(sydney, 14f))

                        for (index in 0 until pokemons.size) {
                            val newPokemon = pokemons[index]
                            if (newPokemon.isCatch == false) {
                                val pokemonLoc = LatLng(newPokemon.location!!.latitude, newPokemon.location!!.longitude)
                                mMap.addMarker(
                                    MarkerOptions()
                                        .position(pokemonLoc).title(newPokemon.name!!)
                                        .snippet(newPokemon.des!! + ", power: " + newPokemon.power!!)
                                        .icon(
                                            BitmapDescriptorFactory
                                                .fromResource(newPokemon.image!!)
                                        )
                                )

                                if (location!!.distanceTo(newPokemon.location) < 2) {
                                    newPokemon.isCatch = true
                                    pokemons[index] = newPokemon
                                    playerPower += newPokemon.power!!
                                    Toast.makeText(applicationContext,
                                        "You catch new pokemon your new power is $playerPower", Toast.LENGTH_LONG
                                    ).show()
                                }
                            }
                        }
                    }

                    Thread.sleep(1000)
                } catch (ex: Exception) {
                }
            }
        }
    }
}
