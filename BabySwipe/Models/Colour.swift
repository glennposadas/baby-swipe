//
//  Colour.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import SwiftUI

class Colour: Swipeable {
  
  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Colour] {
    return [
      .init(title: "Red", color: .red),
      .init(title: "Green", color: .green),
      .init(title: "Blue", color: .blue),
      .init(title: "Black", color: .black),
      .init(title: "Brown", color: .brown),
      .init(title: "Cyan", color: .cyan),
      .init(title: "Gray", color: .gray),
      .init(title: "Pink", color: .pink),
      .init(title: "Indigo", color: .indigo),
      .init(title: "Orange", color: .orange),
      .init(title: "Purple", color: .purple),
      .init(title: "Yellow", color: .yellow),
      .init(title: "Teal", color: .teal)
    ]
  }
  
  // MARK: -
  // MARK: Init
  
  init(title: String, color: Color) {
    super.init(title: title, image: nil)
    self.image = imageForColor(color)
  }
  
  func imageForColor(_ color: Color) -> Image {
    Image(systemName: "square.fill")
      .resizable()
      .frame(width: 100, height: 100)
      .foregroundColor(color) as! Image
  }
}

