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
      .init(title: "Red"),
      .init(title: "Green"),
      .init(title: "Blue"),
      .init(title: "Black"),
      .init(title: "Brown"),
      .init(title: "Gray"),
      .init(title: "Pink"),
      .init(title: "Orange"),
      .init(title: "Purple"),
      .init(title: "Yellow")
    ]
  }
  
  // MARK: -
  // MARK: Init
  
  init(title: String) {
    super.init(title: title, image: nil)
    self.image = Image(title.lowercased())
  }
}

