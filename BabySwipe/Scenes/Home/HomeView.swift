//
//  HomeView.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/23/23.
//

import Lottie
import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      Color(.init(named: "BGColor")!)
      
      VStack {
        LottieView(animation: .named("clouds"))
          .looping()
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  HomeView()
}

