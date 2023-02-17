//
//  EnslistmentProvider.swift
//  EnlistmentApp
//
//  Created by Paulo Keller on 17/11/21.
//

import Foundation
import CoreML

protocol EnlistmentProviderProtocol {
  func calculateEnlistment(input: EnlistmentCalculatorInput) -> Double?
}

public final class EnslistmentProvider {
  private static var sharedEnslistmentProvider: EnslistmentProvider = {
    guard let enlistmentProvider = try? EnslistmentProvider(enlistmentCalculator: .init(configuration: .init())) else {
      fatalError("Cannot create the Enlistment Calculator ML Model")
    }
    
    return enlistmentProvider
  }()
  
  let enlistmentCalculator: EnlistmentCalculator
  
  private init(enlistmentCalculator: EnlistmentCalculator) {
    self.enlistmentCalculator = enlistmentCalculator
  }
  
  class func shared() -> EnslistmentProvider {
    return sharedEnslistmentProvider
  }
}

extension EnslistmentProvider: EnlistmentProviderProtocol {
  func calculateEnlistment(input: EnlistmentCalculatorInput) -> Double? {
    guard let prediction = try? enlistmentCalculator.prediction(input: input) else { return nil }
    return prediction.CONVOCADO
  }
}
