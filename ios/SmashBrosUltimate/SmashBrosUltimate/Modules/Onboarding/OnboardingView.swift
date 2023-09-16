//
//  OnboardingView.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 20/01/22.
//

import SwiftUI
import RealmSwift

struct OnboardingView: View {
  @StateObject private var viewModel: OnboardingViewModel
  
  var images: [(imageName: String, text: String)] = [(imageName: "img_onb_one", text: "Access our Extented Catalog"), (imageName: "img_onb_two", text: "Filter Universes"), (imageName: "img_onb_three", text: "And More...")]
  let realm = try! Realm()
  
  init(realm: Realm) {
    _viewModel = StateObject(wrappedValue: OnboardingViewModel(repository: SBURepository(provider: SBUApiProvider.shared(), realm: realm)))
  }
  
  var body: some View {
    VStack {
      Spacer()
      VStack {
        PagingView(index: $viewModel.index.animation(.easeInOut), maxIndex: images.count - 1) {
          ForEach(self.images, id: \.self.imageName) { item in
            OnboardingWalkthrough(imageName: item.0, text: item.1)
          }
        }
      }.frame(width: 350, height: 450)
      Spacer()
      Button( action: {
        viewModel.index += 1
        if viewModel.index > 2 {
          viewModel.goToAllGamesScreen()
        }
      }) {
        Text(viewModel.index < 2 ? "Next" : "Get Started")
          .font(.system(size: 20))
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .frame(width: 192, height: 54)
      }
      .background(Color(hex:  0xDB3069))
      .cornerRadius(27)
      
      Spacer()
    }.task {
      await viewModel.fetchData()
    }
    .frame(
      minWidth: 0,
      maxWidth: .infinity,
      minHeight: 0,
      maxHeight: .infinity,
      alignment: .topLeading
    )
    .background(
      LinearGradient(gradient: Gradient(colors: [Color(hex:  0xE55249), Color(hex: 0x2A52BE)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    )
    .navigate(to: AllGamesView(realm: realm), when: $viewModel.willMoveToNextScreen)
  }
}
