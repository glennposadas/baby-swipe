//
//  Shape.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import SwiftUI

class Shape: Swipeable {

  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Shape] {
    let shapeNames = [
      "circle",
      "heart",
      "rectangle",
      "square",
      "star",
      "triangle"
    ]
    
    let shapes: [Shape] = shapeNames.map { name in
      return .init(title: name.uppercased(), image: Image(name))
    }
    return shapes
  }
}

