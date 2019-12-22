package com.paulokeller.foodapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_food_details.*
import kotlinx.android.synthetic.main.food_ticket.*
import kotlinx.android.synthetic.main.food_ticket.ivFoodImage
import kotlinx.android.synthetic.main.food_ticket.tvFoodName

class FoodDetailsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_food_details)
        val bundle:Bundle = intent.extras!!

        ivFoodImage.setImageResource(bundle.getInt("image"))
        tvFoodName.text = bundle.getString("name")
        tvFoodDesc.text = bundle.getString("des")
    }
}
