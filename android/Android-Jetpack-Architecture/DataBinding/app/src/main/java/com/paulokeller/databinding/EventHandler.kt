package com.paulokeller.databinding

import android.content.Context
import android.widget.Toast

open class EventHandler(context: Context) {
    val myContext: Context = context

    fun onButtonClick(name: String) {
        Toast.makeText(myContext, "Hello $name", Toast.LENGTH_SHORT).show()
    }
}