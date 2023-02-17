package com.paulokeller.databinding

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.DataBindingUtil
import com.paulokeller.databinding.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val binding: ActivityMainBinding = DataBindingUtil.setContentView(this, R.layout.activity_main)

//        binding.tvName.text = "Dan Brown"
//        binding.tvEmail.text = "danbrown@gmail.com"

        binding.contact = Contact("Dan Brown", "danb@gmail.com")

        binding.handler = EventHandler(this)

        binding.imageUrl = "https://i.redd.it/lhw4vp5yoy121.jpg"
    }
}