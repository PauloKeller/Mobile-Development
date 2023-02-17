package com.paulokeller.myapplication

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Color
import android.os.Build
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.O)
class NotificationHelper(base: Context) : ContextWrapper(base) {

    private val manager: NotificationManager by lazy {
        getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    }

    init {
        val chan1 = NotificationChannel(FIRST_CHANNEL, "First channel", NotificationManager.IMPORTANCE_DEFAULT)
            chan1.lightColor = Color.GREEN
            chan1.lockscreenVisibility = Notification.VISIBILITY_PRIVATE
            manager.createNotificationChannel(chan1)

        val chan2 = NotificationChannel(SECOND_CHANNEL, "Second channel", NotificationManager.IMPORTANCE_DEFAULT)
        chan2.lightColor = Color.GREEN
        chan2.lockscreenVisibility = Notification.VISIBILITY_PRIVATE
        manager.createNotificationChannel(chan2)

        val chan3 = NotificationChannel(THIRD_CHANNEL, "Third channel", NotificationManager.IMPORTANCE_DEFAULT)
        chan3.lightColor = Color.GREEN
        chan3.lockscreenVisibility = Notification.VISIBILITY_PRIVATE
        manager.createNotificationChannel(chan3)
    }

    fun getNotification1(title:String, body:String) : Notification.Builder {
        return Notification.Builder(applicationContext, FIRST_CHANNEL)
            .setContentTitle(title)
            .setContentText(body)
            .setSmallIcon(R.drawable.ic_launcher_background)
            .setAutoCancel(true)
    }

    fun getNotification2(title:String, body:String) : Notification.Builder {
        return Notification.Builder(applicationContext, SECOND_CHANNEL)
            .setContentTitle(title)
            .setContentText(body)
            .setSmallIcon(R.drawable.ic_launcher_background)
            .setAutoCancel(true)
    }

    fun getNotification3(title:String, body:String) : Notification.Builder {
        return Notification.Builder(applicationContext, THIRD_CHANNEL)
            .setContentTitle(title)
            .setContentText(body)
            .setSmallIcon(R.drawable.ic_launcher_background)
            .setAutoCancel(true)
    }



    fun notify(id:Int, notification: Notification.Builder) {
        manager.notify(id, notification.build())
    }

    companion object {
        const val FIRST_CHANNEL = "first"
        const val SECOND_CHANNEL = "second"
        const val THIRD_CHANNEL = "third"
    }
}