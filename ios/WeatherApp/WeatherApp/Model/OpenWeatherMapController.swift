//
//  OpenWeatherMapController.swift
//  WeatherApp
//
//  Created by Paulo Keller on 07/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import Foundation

private enum API {
    static let key = "afc309eadf72c1bd45cda2b2cced04c7"
}

class OpenWeatherMapController: WebServiceController {
    let fallbackService: WebServiceController?
    
    required init(fallbackService: WebServiceController? = nil) {
        self.fallbackService = fallbackService
    }
    
    func fetchWeather(for city: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void) {
        let endpoint = "https://api.openweathermap.org/data/2.5/find?q=\(city)&units=imperial&appid=\(API.key)"
        
        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let endpointURL = URL(string: safeURLString) else {
                completionHandler(nil, WebServiceControllerError.invalidURL(endpoint))
                return
        }
        
        let dataTask = URLSession.shared.dataTask(with: endpointURL) { (data, response, error) in
            guard error == nil else {
                if let fallback = self.fallbackService{
                    fallback.fetchWeather(for: city, completionHandler: completionHandler)
                } else {
                    completionHandler(nil, WebServiceControllerError.forwarded(error!))
                }
                return
            }
            
            guard let responseData = data else {
                if let fallback = self.fallbackService{
                    fallback.fetchWeather(for: city, completionHandler: completionHandler)
                } else {
                    completionHandler(nil, WebServiceControllerError.invalidPayload(endpointURL))
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let weatherList = try decoder.decode(OpenWeatherMapContainer.self, from: responseData)
                guard let weatherInfo = weatherList.list?.first,
                    let weather = weatherInfo.weather.first?.main,
                    let temperature = weatherInfo.main.temp else {
                        completionHandler(nil, WebServiceControllerError.invalidPayload(endpointURL))
                        return
                }
                
                let weatherDescription = "\(weather) \(temperature) 'F"
                completionHandler(weatherDescription, nil)
            } catch let error {
                completionHandler(nil, WebServiceControllerError.forwarded(error))
            }
        }
        
         dataTask.resume()
    }
}
