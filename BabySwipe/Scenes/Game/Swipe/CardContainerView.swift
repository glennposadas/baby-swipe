//
//  CardContainerView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/5/23.
//

import SwiftUI

struct CardContainerView: View {
  
  // MARK: -
  // MARK: Properties
  
  let data: Swipeable
  
  // MARK: -
  // MARK: Body
  
  var body: some View {
    overlayingContentView
      .shadow(radius: 10)
  }
  
  var overlayingContentView: some View {
    return AnyView(
      VStack(spacing: 10) {
        
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.white)
          .overlay(
            data.image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .padding()
          )
          .shadow(radius: 10)
      }
    )
  }
}
