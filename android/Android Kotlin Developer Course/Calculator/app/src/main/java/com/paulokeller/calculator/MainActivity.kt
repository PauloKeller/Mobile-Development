package com.paulokeller.calculator

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    var op = ""
    var oldNumber = ""
    var isNewOp = true

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


    }

    fun buNumberEvent(view: View) {
        if (isNewOp) {
            etShowNumber.setText("")
        }
        isNewOp = false
        val entryData = etShowNumber.text
        val buSelect = view as Button
        var buClickValue: String = etShowNumber.text.toString()
        when (buSelect.id) {
            bu0.id -> {
                buClickValue += "0"
            }
            bu1.id -> {
                buClickValue += "1"
            }
            bu2.id -> {
                buClickValue += "2"
            }
            bu3.id -> {
                buClickValue += "3"
            }
            bu4.id -> {
                buClickValue += "4"
            }
            bu5.id -> {
                buClickValue += "5"
            }
            bu6.id -> {
                buClickValue += "6"
            }
            bu7.id -> {
                buClickValue += "7"
            }
            bu8.id -> {
                buClickValue += "8"
            }
            bu9.id -> {
                buClickValue += "9"
            }
            buDot.id -> {
                buClickValue += "."
            }
            buPlusMinus.id -> {
                buClickValue = "-" + buClickValue
            }
        }

        etShowNumber.setText(buClickValue)
    }

    fun buOpEvent(view: View) {
        val buSelect = view as Button
        var buClickValue: String = etShowNumber.text.toString()
        when (buSelect.id) {
            buMultipler.id -> {
                op = "*"
            }
            buDivision.id -> {
                op = "/"
            }
            buMinus.id -> {
                op = "-"
            }
            buPlus.id -> {
                op = "+"
            }
        }
        oldNumber = etShowNumber.text.toString()
        isNewOp = true
    }

    fun buEqualEvent(view: View) {
        val newNumber = etShowNumber.text.toString()
        var finalNumber: Double? = null
        when (op) {
            "*" -> {
                finalNumber = oldNumber.toDouble() * newNumber.toDouble()
            }
            "/" -> {
                finalNumber = oldNumber.toDouble() / newNumber.toDouble()
            }
            "+" -> {
                finalNumber = oldNumber.toDouble() + newNumber.toDouble()
            }
            "-" -> {
                finalNumber = oldNumber.toDouble() - newNumber.toDouble()
            }
        }
        etShowNumber.setText(finalNumber.toString())
        isNewOp = true
    }

    fun buPercent(view: View) {
        val number = etShowNumber.text.toString().toDouble() / 100;
        etShowNumber.setText(number.toString())
        isNewOp = true
    }

    fun buClean(view: View) {
        etShowNumber.setText("0")
        isNewOp = true
    }
}
