package com.paulokeller.constraintlayout

import android.os.Bundle
import androidx.fragment.app.FragmentActivity

class MainActivity : FragmentActivity(), ToolbarFragment.ToolbarListener {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    override fun onButtonClick(fontSize: Int, text: String) {
        val textFragment: TextFragment = supportFragmentManager.findFragmentById(R.id.fragment2) as TextFragment
        textFragment.changeText(fontSize, text)
    }
}
