package com.paulokeller.findmyphone

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences

class UserData(val context: Context?) {
    private val sharedPreferences = context!!.getSharedPreferences("userData", Context.MODE_PRIVATE);

    fun savePhone(value: String) {
        val editor = sharedPreferences.edit()
        editor.putString("phoneNumber", value)
        editor.apply()
    }

    fun loadPhoneNumber(): String {
        val value = sharedPreferences.getString("phoneNumber", "empty")
        return value!!
    }

    fun isFirstTimeLoad() {
        val value = sharedPreferences.getString("phoneNumber", "empty")
        if (value == "empty") {
            val intent = Intent(context, Login::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            context!!.startActivity(intent)
        }
    }


    fun saveContactInfo() {
        var listOfTrackers = ""
        for ((key, value) in myTrackers) {
            if (listOfTrackers.isEmpty()) {
                listOfTrackers = "$key%$value"
            } else {
                listOfTrackers += "$key%$value"
            }
        }

        if (listOfTrackers.isEmpty()) {
            listOfTrackers = "empty"
        }

        val editor = sharedPreferences.edit()
        editor.putString("listOfTrackers", listOfTrackers)
        editor.apply()
    }

    fun loadContactInfo() {
        myTrackers.clear()
        val listOfTrackers = sharedPreferences.getString("listOfTrackers", "empty")

        if (!listOfTrackers.equals("empty")) {
            val usersInfo = listOfTrackers!!.split("%").toTypedArray()
            var i=0
            while(i<usersInfo.size) {
                myTrackers[usersInfo[i]] = usersInfo[i+1]

                i += 2
            }
        }
    }

    companion object {
        val myTrackers: MutableMap<String, String> = HashMap()

        fun formatPhoneNumber(phoneNumber:String):String {
            var onlyNumber = phoneNumber.replace("[^0-9]".toRegex(), "")
            if (phoneNumber[0] == '+')  {
                onlyNumber = "+$phoneNumber"
            }
            return onlyNumber
        }
    }
}