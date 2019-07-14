package com.paulokeller.findmyage

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*
import java.util.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun buFindAgeEvent(view: View) {
        val userDOB:String = txtYearOfBirth.text.toString()
        if (userDOB.toInt()==0) {
            tvShowAge.text = "invalid input"
        }
        val currentYear = Calendar.getInstance().get(Calendar.YEAR)
        val myAge = currentYear - userDOB.toInt()
        val avg = myAge/userDOB.toInt()
        tvShowAge.text = "Your Age is $myAge years"
    }
}
