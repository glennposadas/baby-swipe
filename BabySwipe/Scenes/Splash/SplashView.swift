//
//  SplashView.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/16/23.
//

import Lottie
import SwiftUI

struct SplashView: View {
  var body: some View {
    ZStack {
      Color(.init(named: "BGColor")!)
      
      VStack {
        LottieView(animation: .named("wave-hand"))
          .looping()
          .padding()
          .offset(y: -100)
      }
      .frame(alignment: .center)
      
      LottieView(animation: .named("hello-white"))
        .looping()
        .padding()
        .offset(y: (UIScreen.main.bounds.height * 0.10))
      
    }
    .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  SplashView()
}
