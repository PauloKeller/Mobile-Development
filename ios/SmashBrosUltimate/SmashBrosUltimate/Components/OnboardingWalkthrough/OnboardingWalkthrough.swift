//
//  OnboardingWalkthrough.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 20/01/22.
//

import SwiftUI

struct OnboardingWalkthrough: View {
  let imageName: String
  let text: String
  
  var body: some View {
    VStack {
      Image(imageName)
        .resizable()
        .frame(width: 350, height: 345)
        .scaledToFit()
      Text(text)
        .multilineTextAlignment(.center)
        .lineLimit(nil)
        .font(.system(size: 36))
        .foregroundColor(.white.opacity(0.8))
    }
  }
}
