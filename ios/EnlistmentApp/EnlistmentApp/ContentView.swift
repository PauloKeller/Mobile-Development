//
//  ContentView.swift
//  EnlistmentApp
//
//  Created by Paulo Keller on 15/11/21.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject private var viewModel = ContentViewModel()
  
  enum Constants {
    static let personalInfoHeaderText = "Dados do usuário"
    static let weightTextFieldText = "Peso (em kg)"
    static let heightTextFieldText = "Altura (em cm)"
    static let headCircumferenceTextFieldText = "Circunferência da cabeça (em cm)"
    static let shoeNumberTextFieldText = "Número do calçado (em cm)"
    static let waistCircumferenceTextFieldText = "Circunferência da cintura (em cm)"
    static let religionHeaderText = "Sobre religião e estado civil"
    static let isPracticingReligionText = "Você pratica alguma religião?"
    static let isMarriedText = "Você é ou já foi casado?"
    static let livingAndHomeCountryHeaderText = "Dados de moradia"
    static let isBrazilHomeCountryText = "Você nasceu no Brasil?"
    static let isCountrysideText = "Você vive em zona rural?"
    static let isOutsideBrazilText = "Você vive fora do Brasil?"
    static let regionOfLivingText = "Região:"
    static let schoolingHeaderText = "Sobre escolaridade"
    static let levelOfEducationText = "Escolaridade:"
    static let enlistmentHeaderText = "Sobre o alistamento"
    static let isOutOfYearText = "Você está fora do ano de alistamento?"
    static let navigationTitle = "Calcular Alistamento"
    static let calculateButtonTitle = "Calcular"
    static let successCalculateAlertTitle = "Sucesso"
    static let successCalculateAlertMessage = "Probabilidade de servir"
  }
  
  var body: some View {
    
    NavigationView {
      Form {
        Section(header: Text(Constants.personalInfoHeaderText)) {
          VStack {
            TextField(
              Constants.weightTextFieldText,
              text: $viewModel.weight
            )
              .disableAutocorrection(true)
            TextField(
              Constants.heightTextFieldText,
              text: $viewModel.height
            )
              .disableAutocorrection(true)
            TextField(
              Constants.headCircumferenceTextFieldText,
              text: $viewModel.headCircumference
            )
              .disableAutocorrection(true)
            TextField(
              Constants.shoeNumberTextFieldText,
              text: $viewModel.shoeNumber
            )
              .disableAutocorrection(true)
            TextField(
              Constants.waistCircumferenceTextFieldText,
              text: $viewModel.waistCircumference
            )
              .disableAutocorrection(true)
          }
          .textFieldStyle(.roundedBorder)
        }
        
        Section(header: Text(Constants.religionHeaderText)) {
          VStack {
            Toggle(isOn: $viewModel.isReligion) {
              Text(Constants.isPracticingReligionText)
            }
          }
          
          VStack {
            Toggle(isOn: $viewModel.isMarried) {
              Text(Constants.isMarriedText)
            }
          }
        }
        
        Section(header: Text(Constants.livingAndHomeCountryHeaderText)) {
          VStack {
            Toggle(isOn: $viewModel.isBrazilian) {
              Text(Constants.isBrazilHomeCountryText)
            }
          }
          
          VStack {
            Toggle(isOn: $viewModel.isCountryside) {
              Text(Constants.isCountrysideText)
            }
          }
          
          VStack {
            Toggle(isOn: $viewModel.isOutsideBrazil) {
              Text(Constants.isOutsideBrazilText)
            }
          }
          
          VStack {
            Picker(selection: $viewModel.selectedRegionOfLiving, label: Text(Constants.regionOfLivingText)) {
              ForEach(RegionOfLiving.allCases) { value in
                Text("\(value.rawValue)").tag(value.self)
              }
            }
          }
        }
        
        Section(header: Text(Constants.schoolingHeaderText)) {
          Picker(selection: $viewModel.selectedSchooling, label: Text(Constants.levelOfEducationText)) {
            ForEach(Schooling.allCases) { value in
              Text("\(value.rawValue)").tag(value.self)
            }
          }
        }
        
        Section(header: Text(Constants.enlistmentHeaderText)) {
          VStack {
            Toggle(isOn: $viewModel.isOutOfYear) {
              Text(Constants.isOutOfYearText)
            }
          }
        }
        
      }.navigationBarTitle(Constants.navigationTitle)
        .navigationBarItems(
          trailing: Button(action: calculateAction) {
            Text(Constants.calculateButtonTitle)
          })
        .alert(isPresented: $viewModel.showingAlert, content: {
          Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Ok")))
        })
    }
  }
  
  func calculateAction() {
    viewModel.calculateEnlistmentProbability()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
