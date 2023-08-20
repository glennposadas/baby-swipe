//
//  WelcomeView.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/16/23.
//

import Lottie
import SwiftUI

struct WelcomeView: View {
  var body: some View {
    LottieView(animation: .named("wave-hand"))
      .looping()
      .frame(maxWidth: 100)
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
