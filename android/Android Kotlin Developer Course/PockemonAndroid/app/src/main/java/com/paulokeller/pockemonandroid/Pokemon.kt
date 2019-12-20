package com.paulokeller.pockemonandroid

import android.location.Location

class Pokemon {
    var name: String? = null
    var des: String? = null
    var image: Int? = null
    var power: Double? = null
    var isCatch: Boolean? = false
    var location:Location? =null

    constructor(image: Int, name: String, des: String, power: Double, lat: Double, log: Double) {
        this.name = name
        this.des = des
        this.power = power
        this.image = image
        location = Location(name)
        this.location!!.latitude = lat
        this.location!!.longitude = log
        this.isCatch = false
    }
}