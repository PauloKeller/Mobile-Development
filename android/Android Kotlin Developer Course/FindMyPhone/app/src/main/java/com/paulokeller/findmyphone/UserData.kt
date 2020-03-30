package com.paulokeller.findmyphone

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences

class UserData(val context: Context?) {
    private val sharedPreferences = context!!.getSharedPreferences("userData", Context.MODE_PRIVATE);

    fun savePhone(value:String) {
        val editor = sharedPreferences.edit()
        editor.putString("phoneNumber", value)
        editor.apply()
    }

    fun loadPhoneNumber():String {
        val value = sharedPreferences.getString("phoneNumber", "empty")
        if (value == "empty") {
            val intent = Intent(context, Login::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            context!!.startActivity(intent)
        }
        return value!!
    }
}