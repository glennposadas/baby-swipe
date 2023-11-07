//
//  Animal.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/7/23.
//

import SwiftUI

class Animal: Swipeable {
  
  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Animal] {
    let animalNames = [
      "bird",
      "cat",
      "chicken",
      "dog",
      "fish",
      "gorilla"
    ]
    
    let animals: [Animal] = animalNames.map { name in
      return .init(title: name.uppercased(), image: Image("\(name)"))
    }
    return animals
  }
}
