//
//  Fruit.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import SwiftUI

class Fruit: Swipeable {

  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Fruit] {
    let fruitNames = [
      "circle",
      "heart",
      "rectangle",
      "square",
      "star",
      "triangle"
    ]
    
    let fruits: [Fruit] = fruitNames.map { name in
      return .init(title: name.uppercased(), image: Image("\(name)"))
    }
    return fruits
  }
}

todo:---
