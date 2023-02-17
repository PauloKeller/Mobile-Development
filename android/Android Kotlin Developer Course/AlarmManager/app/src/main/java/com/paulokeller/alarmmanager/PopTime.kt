package com.paulokeller.alarmmanager

import android.os.Build
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TimePicker
import androidx.annotation.RequiresApi
import androidx.fragment.app.DialogFragment

class PopTime: DialogFragment() {
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val myView = inflater.inflate(R.layout.pop_time, container, false)
        val buDone = myView.findViewById<Button>(R.id.buDone)
        val tp1 = myView.findViewById<TimePicker>(R.id.tp1)

        buDone.setOnClickListener(View.OnClickListener {
            val ma = activity as MainActivity
            if (Build.VERSION.SDK_INT >= 23) {
                ma.setTime(tp1.hour, tp1.minute)
            } else {
                ma.setTime(tp1.currentHour, tp1.currentMinute)
            }

            this.dismiss()
        })


        return myView
    }
}