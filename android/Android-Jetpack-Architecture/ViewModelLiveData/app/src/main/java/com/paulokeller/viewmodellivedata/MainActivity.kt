package com.paulokeller.viewmodellivedata

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    lateinit var data: MainActivityViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val model = ViewModelProvider(this).get(MainActivityViewModel::class.java)
        val myRandomNumber: MutableLiveData<String> = model.getNumber()

        myRandomNumber.observe(this, Observer<String> { number ->
            tvNumber.text = number
            Log.i(TAG, "Random number set")
        })

//        data = MainActivityDataGenerator()
//        val myRandomNumber: String = data.getNumber()

        bRandom.setOnClickListener {
            model.createNumber()
        }
    }

    companion object {
        private val TAG: String? = MainActivity::class.simpleName
    }
}
