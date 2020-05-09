//
//  WebServiceController.swift
//  WeatherApp
//
//  Created by Paulo Keller on 07/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import Foundation

public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

public protocol WebServiceController {
    init(fallbackService: WebServiceController?)
      
    var fallbackService: WebServiceController? { get }
    
    func fetchWeather(for city: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void)
}
