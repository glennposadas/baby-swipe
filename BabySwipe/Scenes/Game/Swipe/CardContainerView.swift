//
//  CardContainerView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/5/23.
//

import SwiftUI

struct CardContainerView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(Color.white)
      .overlay(
        VStack(spacing: 10) {
          Image(systemName: "heart.fill")
            .font(.system(size: 50))
            .foregroundColor(.pink)
          Text("Example Card")
            .font(.title)
            .bold()
          Text("This is an example card with some beautiful UI.")
            .font(.body)
            .foregroundColor(.gray)
        }
          .padding()
      )
      .shadow(radius: 10)
  }
}
