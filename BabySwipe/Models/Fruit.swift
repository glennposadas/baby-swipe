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
      "apple",
      "banana",
      "lemon",
      "mango",
      "orange_fruit",
      "pineapple",
      "strawberry",
      "watermelon"
    ]
    
    let fruits: [Fruit] = fruitNames.map { name in
      return .init(title: name.uppercased(), image: Image(name))
    }
    return fruits
  }
}
