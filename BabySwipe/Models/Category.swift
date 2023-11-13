//
//  Category.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/3/23.
//

import SwiftUI

enum Category: String {
  case shapes
  case animals
  case colors
  case fruits
  case letters
  case numbers
  
  static var all: [Category] {
    return [
      .animals,
      .colors,
      .fruits,
      .letters,
      .numbers,
      .shapes
    ]
  }
  
  var title: String {
    rawValue.capitalized
  }
  
  var icon: Image {
    Image("\(rawValue)")
  }
  
  var allData: [Swipeable] {
    switch self {
    case .animals: Animal.allData()
    case .colors: Colour.allData()
    case .fruits: Fruit.allData()
    case .letters: Letter.allData()
    case .numbers: Number.allData()
    case .shapes: BabySwipe.Shape.allData()
    }
  }
}
