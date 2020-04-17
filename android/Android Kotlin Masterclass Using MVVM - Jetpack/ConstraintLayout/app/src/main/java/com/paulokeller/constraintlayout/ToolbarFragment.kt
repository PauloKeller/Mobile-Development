package com.paulokeller.constraintlayout

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.SeekBar
import androidx.fragment.app.Fragment
import kotlinx.android.synthetic.main.toolbar_fragment.*
import java.lang.ClassCastException

class ToolbarFragment : Fragment(), SeekBar.OnSeekBarChangeListener {
    var seekValue = 12
    var activityCallBack: ToolbarFragment.ToolbarListener? = null

    interface ToolbarListener {
        fun onButtonClick(fontSize: Int, text: String)
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        try {
            activityCallBack = context as ToolbarListener
        } catch (e: ClassCastException) {
            throw ClassCastException(context.toString() + "must implement ToolbarListener")
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // infalte the layout for this fragment
        val view = inflater.inflate(R.layout.toolbar_fragment, container, false)
        val seekBar: SeekBar? = view?.findViewById(R.id.seekBar)
        val button: Button? = view?.findViewById(R.id.but)

        seekBar?.setOnSeekBarChangeListener(this)
        button?.setOnClickListener { v: View -> buttonClicked(v) }
        return view
    }

    private fun buttonClicked(view: View) {
        activityCallBack?.onButtonClick(seekValue, editText.text.toString())
    }

    override fun onProgressChanged(seekBar: SeekBar?, progress: Int, p2: Boolean) {
        seekValue = progress
    }

    override fun onStartTrackingTouch(p0: SeekBar?) {
    }

    override fun onStopTrackingTouch(p0: SeekBar?) {
    }

}