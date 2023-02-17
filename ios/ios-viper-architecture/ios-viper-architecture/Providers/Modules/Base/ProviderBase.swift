//
//  ProviderBase.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 14/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation
import Alamofire

protocol ProviderBase: Routerable {
  var method: RouterHTTPMethod { get }
}

extension ProviderBase {
  
  func request(headers: HTTPHeaders? = nil, successBlock: @escaping () -> Void, failureBlock: @escaping (_ contentError: ResponseErrorCallback) -> Void, successTrackedEvent: String? = nil, failureTrackedEvent: String? = nil) {
    BaseRouter().request(method: method, endPoint: endpoint, params: nil, headers: headers, successBlock: { response in
      if let trackedEvent = successTrackedEvent {
        TrackAnalytics.shared.successProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint)
      }
      successBlock()
    }, failureBlock: { error in
      let contentData = ResponseErrorCallback(error)
      if let trackedEvent = failureTrackedEvent {
        TrackAnalytics.shared.errorProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, contentData: contentData)
      }
      failureBlock(contentData)
    })
  }
  
  func request<E: Encodable>(params: E, successBlock: @escaping () -> Void, failureBlock: @escaping (_ contentError: ResponseErrorCallback) -> Void, successTrackedEvent: String? = nil, failureTrackedEvent: String? = nil) {
    BaseRouter().request(method: method, endPoint: endpoint, params: params.convertToDictionary(), successBlock: { response in
      if let trackedEvent = successTrackedEvent {
        TrackAnalytics.shared.successProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint)
      }
      successBlock()
    }, failureBlock: { error in
      let contentData = ResponseErrorCallback(error)
      if let trackedEvent = failureTrackedEvent {
        TrackAnalytics.shared.errorProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, contentData: contentData)
      }
      failureBlock(contentData)
    })
  }

  func request<E: Encodable, T: Decodable>(params: E, successBlock: @escaping (_ contentData: ResponseSuccessCallback<T>) -> Void, failureBlock: @escaping (_ contentError: ResponseErrorCallback) -> Void, successTrackedEvent: String? = nil, failureTrackedEvent: String? = nil) {
    BaseRouter().request(method: method, endPoint: endpoint, params: params.convertToDictionary(), successBlock: { response in
      let contentData = ResponseSuccessCallback<T>(body: response)
      if let trackedEvent = successTrackedEvent {
        TrackAnalytics.shared.successProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, responseTime: contentData.responseTime)
      }
      successBlock(contentData)
    }, failureBlock: { error in
      let contentData = ResponseErrorCallback(error)
      if let trackedEvent = failureTrackedEvent {
        TrackAnalytics.shared.errorProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, contentData: contentData)
      }
      failureBlock(contentData)
    })
  }
  
  func request<T: Decodable>(successBlock: @escaping (_ contentData: ResponseSuccessCallback<T>) -> Void, failureBlock: @escaping (_ contentError: ResponseErrorCallback) -> Void, successTrackedEvent: String? = nil, failureTrackedEvent: String? = nil) {
    BaseRouter().request(method: method, endPoint: endpoint, params: nil, successBlock: { response in
      let contentData = ResponseSuccessCallback<T>(body: response)
      if let trackedEvent = successTrackedEvent {
        TrackAnalytics.shared.successProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, responseTime: contentData.responseTime)
      }
      successBlock(contentData)
    }, failureBlock: { error in
      let contentData = ResponseErrorCallback(error)
      if let trackedEvent = failureTrackedEvent {
        TrackAnalytics.shared.errorProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, contentData: contentData)
      }
      failureBlock(contentData)
    })
  }
  
  func request(params: [String: Any], successBlock: @escaping () -> Void, failureBlock: @escaping (_ contentError: ResponseErrorCallback) -> Void, successTrackedEvent: String? = nil, failureTrackedEvent: String? = nil) {
    BaseRouter().request(method: method, endPoint: endpoint, params: params, successBlock: { response in
      if let trackedEvent = successTrackedEvent {
        TrackAnalytics.shared.successProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint)
      }
      successBlock()
    }, failureBlock: { error in
      let contentData = ResponseErrorCallback(error)
      if let trackedEvent = failureTrackedEvent {
        TrackAnalytics.shared.errorProviderTrackAnalyticsEvent(event: trackedEvent, url: self.endpoint, contentData: contentData)
      }
      failureBlock(contentData)
    })
  }
}
