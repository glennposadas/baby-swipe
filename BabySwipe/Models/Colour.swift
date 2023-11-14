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
    let colorNames = [
      "Red",
      "Green",
      "Blue",
      "Black",
      "Brown",
      "Gray",
      "Pink",
      "Orange",
      "Purple",
      "Yellow"
    ]
    
    let colors: [Colour] = colorNames.map { name in
      return .init(title: name.uppercased(), image: Image(name.lowercased()))
    }
    return colors
  }
}

