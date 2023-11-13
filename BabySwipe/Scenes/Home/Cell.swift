//
//  Cell.swift
//  BabyVision
//
//  Created by Glenn Posadas on 10/16/23.
//

import SwiftUI

struct Cell: View {
  
  @State var category: Category
  
  var body: some View {
    category.icon
      .resizable()
      .scaledToFill()
      .frame(minWidth: 0, maxWidth: .infinity)
      .cornerRadius(10)
      .shadow(color: Color.primary.opacity(0.3), radius: 1)
      .overlay {
        VStack {
          Text(category.title.uppercased())
            .font(.custom("Kinderland", size: 30))
            .foregroundStyle(.white)
            .padding(.all, 10)
            .background(
              LinearGradient(gradient: Gradient(colors: [.gradient2, .gradient1]),
                             startPoint: .top,
                             endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10)
              .stroke(Color.white, lineWidth: 2)
            )
        }
      }
      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  Cell(category: .animals)
    .frame(width: UIScreen.main.bounds.width - 30, height: 150)
}
