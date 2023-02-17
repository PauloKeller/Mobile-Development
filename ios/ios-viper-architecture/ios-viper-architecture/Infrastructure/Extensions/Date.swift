//
//  Date.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 14/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

extension Date {
  func toString(_ pattern: String = "dd-MM-yyyy'T'HH:mm:ss", timeZone: TimeZone? = nil) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .iso8601)
    dateFormatter.dateFormat = pattern
    if let timeZone = timeZone {
      dateFormatter.timeZone = timeZone
    }
    
    return dateFormatter.string(from: self)
  }
  
  /// SwifterSwift: Date by adding multiples of calendar component.
  ///
  ///   let date = Date() // "Jan 12, 2017, 7:07 PM"
  ///   let date2 = date.adding(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
  ///   let date3 = date.adding(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
  ///   let date4 = date.adding(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
  ///   let date5 = date.adding(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
  ///
  /// - Parameters:
  ///   - component: component type.
  ///   - value: multiples of components to add.
  /// - Returns: original date + multiples of component added.
  func adding(_ component: Calendar.Component, value: Int) -> Date {
    return Calendar.current.date(byAdding: component, value: value, to: self)!
  }
}
