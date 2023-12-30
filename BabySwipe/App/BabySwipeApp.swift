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
  @State private var play = false
  
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
        HomeView(onPlay: {
          play = true
        })
        .fullScreenCover(isPresented: $play, content: {
          CategoriesView()
        })
      }
    }
  }
}
