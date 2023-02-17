//
//  ContentViewModel.swift
//  EnlistmentApp
//
//  Created by Paulo Keller on 17/11/21.
//

import Foundation

enum Schooling: String, CaseIterable, Identifiable {
  case didntAttendSchool = "Não frequentou escola"
  case elementarySchool = "Ensino fundamental"
  case highSchool = "Ensino médio"
  case graduate = "Ensino superior"
  var id: String { String(self.rawValue) }
}

enum RegionOfLiving: String, CaseIterable, Identifiable {
  case north = "Norte"
  case northeast = "Nordeste"
  case southeast = "Suldeste"
  case south = "Sul"
  case midwest = "Centroeste"
  case bornAbroad = "Nasceu fora do Brasil"
  var id: String { String(self.rawValue) }
}

final class ContentViewModel: ObservableObject {
  @Published var showingAlert = false
  @Published var weight: String = ""
  @Published var height: String = ""
  @Published var headCircumference: String = ""
  @Published var shoeNumber: String = ""
  @Published var waistCircumference: String = ""
  @Published var isReligion = false
  @Published var isMarried = false
  @Published var isBrazilian = false
  @Published var isCountryside = false
  @Published var isOutsideBrazil = false
  @Published var isOutOfYear = false
  @Published var selectedSchooling: Schooling = .didntAttendSchool
  @Published var selectedRegionOfLiving: RegionOfLiving = .southeast
  @Published var percentChance: Double = 0.0
  @Published var alertTitle = ""
  @Published var alertMessage = ""
  
  private var provider: EnlistmentProviderProtocol
  
  enum Strings {
    static let successCalculateAlertTitle = "Sucesso"
    static let successCalculateAlertMessage = "Probabilidade de servir"
    static let failCalculateAlertTitle = "Falha"
    static let failCalculateAlertMessage = "Não foi possivel calcular a probabilidade, tente novamente por favor atualizando seus dados."
  }
  
  init(provider: EnlistmentProviderProtocol = EnslistmentProvider.shared()) {
    self.provider = provider
  }
  
  func calculateEnlistmentProbability() {
      guard let wight = Double(weight), let height = Double(height), let headCircumference = Double(headCircumference), let shoeNumber = Double(shoeNumber), let waistCircumference = Double(waistCircumference) else {
        return
      }
      
      let input = EnlistmentCalculatorInput(PESO: wight, ALTURA: height, CABECA: headCircumference, CALCADO: shoeNumber, CINTURA: waistCircumference, RELIGIAO: isReligion ? 1 : 0, PAIS_NASCIMENTO: isBrazilian ? 1 : 0, ESTADO_CIVIL: isMarried ? 1 : 0, ZONA_RESIDENCIAL: isCountryside ? 1 : 0, PAIS_RESIDENCIA: isOutsideBrazil ? 1 : 0, OUT_OF_YEAR: isOutOfYear ? 1 : 0, EDUC_0: selectedSchooling == .didntAttendSchool ? 1 : 0, EDUC_1: selectedSchooling == .elementarySchool ? 1 : 0, EDUC_2: selectedSchooling == .highSchool ? 1 : 0, EDUC_3: selectedSchooling == .graduate ? 1 : 0, JSM_UF_1: 0, JSM_UF_2: 1, JSM_UF_3: 0, JSM_UF_4: 0, JSM_UF_5: 0, JSM_UF_6: 0)
      
      if let prediction = provider.calculateEnlistment(input: input) {
        percentChance = prediction
        alertTitle = Strings.successCalculateAlertTitle
        alertMessage = "\(Strings.successCalculateAlertMessage): \(round(percentChance*100))%"
        showingAlert.toggle()
      } else {
        alertTitle = Strings.failCalculateAlertTitle
        alertMessage = Strings.failCalculateAlertMessage
        showingAlert.toggle()
      }
  }
}
