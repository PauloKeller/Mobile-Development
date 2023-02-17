package com.paulokeller.constraintlayout

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import kotlinx.android.synthetic.main.text_fragment.*

class TextFragment : Fragment() {
    override fun onCreateView(inflater: LayoutInflater,
                              container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.text_fragment, container, false)
    }

    fun changeText(fontSize:Int, text:String) {
        textView.textSize = fontSize.toFloat()
        textView.text = text
    }
}