package com.paulokeller.alarmmanager

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.widget.Toast

class MyBroadcastReceiver: BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        if (intent!!.action == "com.tester.alarmmanager") {
            val bundle = intent.extras
            val message = bundle!!.getString("message")

            val notifyMe = Notifications()
            notifyMe.Notify(context!!, message!!, 10)
        } else if (intent.action == "android.intent.action.BOOT_COMPLETED") {
            val saveData = SaveData(context!!)
            saveData.setAlarm()
        }
    }

}