//
//  WeatherStackData.swift
//  WeatherApp
//
//  Created by Paulo Keller on 09/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import Foundation

struct WeatherStackContainer: Codable {
    var current: WeatherStackCurrent?
}

struct WeatherStackCurrent: Codable {
    let temperature: Int?
    let weather_descriptions: [String]?
}

struct WeatherStackCondition: Codable {
    var text: String
    var icon: String
}
