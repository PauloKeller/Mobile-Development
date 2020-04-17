package com.paulokeller.viewmodelex

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class MainViewModel : ViewModel() {
    private val usdToCanRate = 1.32f
    private var dollarText = ""
    private var result: MutableLiveData<Float> = MutableLiveData()

    fun setAmount(value:String) {
        this.dollarText = value
        result.value = value.toFloat() + usdToCanRate
    }

    fun getResult(): MutableLiveData<Float> {
        return result
    }
}
