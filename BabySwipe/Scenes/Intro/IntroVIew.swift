//
//  IntroVIew.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/3/23.
//

import Lottie
import SwiftUI

struct IntroVIew: View {
  
  // MARK: -
  // MARK: Properties
  
  @State private var isAnimating = false
  
  // MARK: -
  // MARK: Functions
  
  var body: some View {
    ZStack {
      Color(.init(named: "BGColor")!)
      
      ZStack {
        
        VStack {
          LottieView(animation: .named("clouds"))
            .looping()
            .offset(y: (UIScreen.main.bounds.height * -0.10))
          
          HStack {
              ZStack {
                  ForEach(1...7, id: \.self) { index in
                    AnimatedCharacterView(index: index)
                  }
              }
          }
          
        }
        
        // Main logo
        Image("MainLogo")
          .scaleEffect(isAnimating ? 1.2 : 0.9) // Inflate and deflate
          .offset(x: 0, y: -40)
          .animation(
            Animation.easeInOut(duration: 1.0)
              .repeatForever(autoreverses: true),
            value: UUID()
          )
          .onAppear {
            isAnimating = true
          }
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct AnimatedCharacterView: View {
  
  // Characters by Jeffrey Christopher
  
  @State var index: Int
  @State private var isAnimating = false
  
  var body: some View {
    LottieView(animation: .named("char\(index)"))
        .looping()
        .frame(width: 250)
        .offset(
          x: isAnimating ? targetEndXPt(index: index)
          : initialXPt(index: index),
            y: UIScreen.main.bounds.height * 0.15
        )
        .animation(
          Animation.linear(duration: TimeInterval(Int.random(in: 4...10) + index))
                .repeatForever(autoreverses: false),
            value: UUID()
        )
        .onAppear {
          isAnimating = true
        }
  }
  
  private func initialXPt(index: Int) -> CGFloat {
    return (-UIScreen.main.bounds.width * 0.5) - CGFloat(index * 100)
  }
  
  private func targetEndXPt(index: Int) -> CGFloat {
    return UIScreen.main.bounds.width * 0.8
  }
}

#Preview {
  IntroVIew()
}
