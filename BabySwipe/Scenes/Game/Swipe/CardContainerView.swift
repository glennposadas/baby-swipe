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
    if let image = data.image {
      return AnyView(
        VStack(spacing: 10) {
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
      )
    } else {
      return AnyView(
        VStack(spacing: 10) {
          Text(data.title)
            .font(.system(size: 60, weight: .bold, design: .rounded))
        }
      )
    }
  }
}
