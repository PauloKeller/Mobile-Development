//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Paulo Keller on 09/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let weatherService = OpenWeatherMapController(fallbackService: WeatherStackController())
    
    @Published var weatherInfo = ""
    
    func fetch(city: String) {
        weatherService.fetchWeather(for: city, completionHandler: { (info, error) in
            guard error == nil,
                let weatherInfo = info else {
                    DispatchQueue.main.async {
                        self.weatherInfo = "Could not retrieve weather information for \(city)"
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.weatherInfo = weatherInfo
                }
            }
        )
    }
}
