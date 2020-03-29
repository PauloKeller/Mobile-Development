package com.paulokeller.alarmmanager

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import java.util.*

class SaveData(val context: Context)  {
    private val sharedPreferences = context.getSharedPreferences("myref", Context.MODE_PRIVATE)

    fun saveData(hour:Int, minute: Int) {
        val editor = sharedPreferences.edit()
        editor.putInt("hour", hour)
        editor.putInt("minute", minute)
        editor.apply()
    }

    fun getHour(): Int {
        return sharedPreferences.getInt("hour", 0)
    }

    fun getMinute(): Int {
        return sharedPreferences.getInt("minute", 0)
    }

    fun setAlarm() {
        val hour = getHour()
        val minute = getMinute()
        val calendar = Calendar.getInstance()
        calendar.set(Calendar.HOUR, hour)
        calendar.set(Calendar.MINUTE, minute)
        calendar.set(Calendar.SECOND, 0)

        val intent = Intent(context, MyBroadcastReceiver::class.java)
        intent.putExtra("message", "alarm time")
        intent.action = "com.tester.alarmmanager"
        val pendingIntent = PendingIntent.getBroadcast(context,0,intent, PendingIntent.FLAG_UPDATE_CURRENT)

        val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        am.setRepeating(AlarmManager.RTC_WAKEUP, calendar.timeInMillis, AlarmManager.INTERVAL_DAY, pendingIntent)
    }
}