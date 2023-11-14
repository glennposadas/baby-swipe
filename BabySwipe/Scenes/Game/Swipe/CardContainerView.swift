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
  }
  
  var overlayingContentView: some View {
    return AnyView(
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.white)
          .shadow(radius: 6)
        data.image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding()
      }
    )
  }
}
