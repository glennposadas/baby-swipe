//
//  Animal.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/7/23.
//

import RevenueCat
import SwiftUI

class Animal: Swipeable {
  
  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Animal] {
    var animalNames = [
      "bird",
      "cat",
      "chicken",
      "dog",
      "fish",
      "gorilla"
    ]
    
    if let allPurchasedProductIdentifiers = Purchases.shared.cachedCustomerInfo?.allPurchasedProductIdentifiers,
       allPurchasedProductIdentifiers.count > 0 {
      // Premium.
      animalNames += [
        "elephant",
        "lion",
        "mouse",
        "tiger"
      ]
    }
    
    let animals: [Animal] = animalNames.map { name in
      return .init(title: name.uppercased(), image: Image(name))
    }
    return animals
  }
}
