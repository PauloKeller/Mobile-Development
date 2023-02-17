//
//  TrackAnalytics.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 14/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

final class TrackAnalytics: NSObject {
  
  override private init() {}
  static let shared = TrackAnalytics()

  enum AnalyticType {
    case firebase
    case appsFlyer

    var nameService: String {
      switch self {
      case .firebase: return "Firebase"
      case .appsFlyer: return "AppsFlyer"
      }
    }
  }
  
  func genericTrackAnalyticsEvent(event: String, parameters: [String: Any]?) {
    trackFirebaseEvent(event: event, parameters: parameters)
    trackAppsFlyerEvent(event: event, parameters: parameters)
  }
  
  ///Only user inside Presenters
  func clickedButtonTrackAnalyticsEvent(event: String) {
    let currentDateTime = Date()
    let params: [String: Any] = [
      "hora": currentDateTime.toString() as Any
    ]
    
    trackFirebaseEvent(event: event, parameters: params)
    trackAppsFlyerEvent(event: event, parameters: params)
  }
  
  func successProviderTrackAnalyticsEvent(event: String, url: String, responseTime: Date? = Date()) {
    let params: [String: Any] = [
      "url": url,
      "hora": responseTime?.toString() as Any
    ]
    
    trackFirebaseEvent(event: event, parameters: params)
    trackAppsFlyerEvent(event: event, parameters: params)
  }
  
  func errorProviderTrackAnalyticsEvent(event: String, url: String, contentData: ResponseErrorCallback) {
    let params: [String: Any] = [
      "url": url,
      "hora": contentData.responseTime?.toString() as Any,
      "codigo": contentData.errors?.first?.code  as Any,
      "mensagem": contentData.errors?.first?.message  as Any
    ]
    
    trackFirebaseEvent(event: event, parameters: params)
    trackAppsFlyerEvent(event: event, parameters: params)
  }
    
  fileprivate func trackFirebaseEvent(event: String, parameters: [String: Any]?) {
    #warning("TODO: Create Firebase manager")
    showLogsEvents(event: event, parameters: parameters, analyticType: .firebase)
  }
  
  fileprivate func trackAppsFlyerEvent(event: String, parameters: [String: Any]?) {
    #warning("TODO: Create Apps Flyer manager")
    showLogsEvents(event: event, parameters: parameters, analyticType: .appsFlyer)
  }
  
  fileprivate func showLogsEvents(event: String, parameters: [String: Any]?, analyticType: AnalyticType) {
    #if DEBUG_LOG
    var params: String?
    
    if let parameters = parameters as? [String: String] {
      params = parameters.prettyPrintedJSON
    }
    
    NSLog("\n")
    NSLog("[CleanArchitecture] [\(analyticType.nameService)]  evento: \(event)")
    NSLog("[CleanArchitecture] [\(analyticType.nameService)]  parametros: \n\(params ?? "-")")
    NSLog("\n")
    #endif
  }
}
