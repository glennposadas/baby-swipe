//
//  BabySwipeApp.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/16/23.
//

import SwiftUI

@main
struct BabySwipeApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
  
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
