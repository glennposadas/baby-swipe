//
//  AnimatedCharacterView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/3/23.
//

import Lottie
import SwiftUI

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
