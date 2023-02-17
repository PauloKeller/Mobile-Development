package com.paulokeller.myapplication

import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.annotation.RequiresApi
import kotlinx.android.synthetic.main.activity_main.*

@RequiresApi(Build.VERSION_CODES.O)
class MainActivity : AppCompatActivity() {
    private var notificationHelper: NotificationHelper? = null


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        notificationHelper = NotificationHelper(this)
    }

    fun ch1Click(view: View) {
        notificationHelper!!.notify(
            1,
            notificationHelper!!.getNotification1("First", etMessage.text.toString())
        )
    }

    fun ch2Click(view: View) {
        notificationHelper!!.notify(
            2,
            notificationHelper!!.getNotification2("Second", etMessage.text.toString())
        )
    }

    fun ch3Click(view: View) {
        notificationHelper!!.notify(
            3,
            notificationHelper!!.getNotification3("Third", etMessage.text.toString())
        )
    }
}
