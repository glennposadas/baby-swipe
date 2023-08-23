//
//  BabiesFirstsApp.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/16/23.
//

import SwiftUI

@main
struct BabiesFirstsApp: App {
  @State private var showSplash = true
  
  var body: some Scene {
    WindowGroup {
      if showSplash {
        SplashView()
          .onAppear {
            Delay.delay(3) {
              withAnimation {
                showSplash = false
              }
            }
          }
      } else {
        HomeView()
      }
    }
  }
}
