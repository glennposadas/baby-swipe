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
      .scaledToFit()
      .frame(minWidth: 0, maxWidth: .infinity)
      .cornerRadius(10)
      .shadow(color: Color.primary.opacity(0.3), radius: 1)
  }
}
