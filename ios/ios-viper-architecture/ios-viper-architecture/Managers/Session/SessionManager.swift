//
//  SessionManager.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 03/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

class SessionManager {

  // MARK: - Properties

  static let sharedInstance = SessionManager()
  private static var jwt: String = ""
  private static var accessToken: String = ""
  private static var passwordForBiometric: String = ""
  private static var sessionID: String = ""
  private static var lastDateTimeRequest: Date?

  //Session Manager
  private let sessionMinutesDuration = 5
  private var sessionManagerStateResponse: SessionManagerStateResponse?
  
  // MARK: - Methods
  
  func setSessionId(id: String) {
    SessionManager.sessionID = id
  }

  func getSessionId() -> String {
    return SessionManager.sessionID
  }

  func setUserAccessToken(data: String) {
    SessionManager.accessToken = data
  }

  func getUserAccessToken() -> String {
    return SessionManager.accessToken
  }

  func setJWT(data: String) {
    SessionManager.jwt = data
  }

  func getJWT() -> String {
    return SessionManager.jwt
  }

  func setPasswordForBiometric(pass: String) {
    SessionManager.passwordForBiometric = pass
  }

  func getPasswordForBiometric() -> String {
    return SessionManager.passwordForBiometric
  }
  
  func logoutUser() {
    fatalError("Implementation pending...")
  }

  func unregisterDevice() {
    fatalError("Implementation pending...")
  }
  
  func forceExpire() {
    logoutUser()
    sessionManagerStateResponse?.sessionExpired()
  }

  func validateSession() -> Bool {

    let currentDate = Date()
    guard let lastRequestDate = SessionManager.lastDateTimeRequest else {
      return false
    }

    if currentDate > lastRequestDate {
      SessionManager.lastDateTimeRequest = nil
      forceExpire()
      return false
    }

    return true
  }

  func setLastRequestTime(lastTime: Date?) {

    if let newLastTime = lastTime {
      // TODO: Extensions
      SessionManager.lastDateTimeRequest = newLastTime.adding(.minute, value: sessionMinutesDuration)
    } else {
      SessionManager.lastDateTimeRequest = nil
    }
  }

  func getLastRequestTime() -> Date? {
    return SessionManager.lastDateTimeRequest
  }

  func setsetSessionStateResponse(sessionManagerStateResponse: SessionManagerStateResponse) {
    self.sessionManagerStateResponse = sessionManagerStateResponse
  }
}

protocol SessionManagerStateResponse {
  func sessionExpired()
}

