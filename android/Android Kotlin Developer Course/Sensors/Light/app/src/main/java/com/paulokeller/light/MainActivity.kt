package com.paulokeller.light

import android.content.Context
import android.hardware.*
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Vibrator
import android.widget.Toast

class MainActivity : AppCompatActivity() , SensorEventListener {
    private var sensor: Sensor? = null
    private var sensorManager: SensorManager? = null
    private var xold = 0.0
    private var yold = 0.0
    private var zold = 0.0
    var threadShould = 3000.0
    private var oldTime:Long = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        sensor = sensorManager!!.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
    }

    override fun onAccuracyChanged(p0: Sensor?, p1: Int) {

    }

    override fun onSensorChanged(event: SensorEvent?) {
        var x = event!!.values[0]
        var y = event.values[1]
        var z = event.values[2]

        val currentTime = System.currentTimeMillis()
           val timeDiff = currentTime - oldTime
        if ((timeDiff) > 100) {
            oldTime = currentTime
            var speed = Math.abs(x+y+z-xold-yold-zold) / timeDiff*10000
            if (speed > threadShould) {
                var v = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
                v.vibrate(500)
                Toast.makeText(applicationContext, "Shock!", Toast.LENGTH_LONG).show()
            }
        }

    }

    override fun onResume() {
        super.onResume()
        sensorManager!!.registerListener(this, sensor, SensorManager.SENSOR_DELAY_NORMAL)
    }


    override fun onPause() {
        super.onPause()
        sensorManager!!.unregisterListener(this)
    }

}
