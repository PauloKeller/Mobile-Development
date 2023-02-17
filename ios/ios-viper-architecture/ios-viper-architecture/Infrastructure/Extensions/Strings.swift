//
//  Strings.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

extension String {
  var formatISO8601ToDate: Date? {
    let dFormatter = DateFormatter()
    dFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
    dFormatter.locale = Locale(identifier: "en_US") //Force english locale because return nil conversion with another locale.
    return dFormatter.date(from: self)
  }
}
