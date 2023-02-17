//
//  OpenWeatherMapData.swift
//  WeatherApp
//
//  Created by Paulo Keller on 07/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import Foundation

struct OpenWeatherMapContainer: Codable {
    var list: [OpenMapWeatherData]?
}

struct OpenMapWeatherData: Codable {
    var weather: [OpenMapWeatherWeather]
    var main: OpenMapWeatherMain
}

struct OpenMapWeatherWeather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct OpenMapWeatherMain: Codable {
    var temp: Float?
}
