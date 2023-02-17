package com.paulokeller.alarmmanager

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.fragment.app.FragmentManager
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.concurrent.fixedRateTimer

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val saveData = SaveData(applicationContext)
        tvShowTime.text = "${saveData.getHour()}:${saveData.getMinute()}"
    }

    fun setTime(hours:Int, minute:Int) {
        tvShowTime.text = "$hours:$minute"
        val saveData = SaveData(applicationContext)
        saveData.saveData(hours, minute)
        saveData.setAlarm()
    }

    fun buSetTime(view: View) {
        val fm = this.supportFragmentManager;
        val popTime= PopTime()
        popTime.show(fm,"Select time")
    }
}
