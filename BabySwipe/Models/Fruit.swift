//
//  Fruit.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import RevenueCat
import SwiftUI

class Fruit: Swipeable {
  
  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Fruit] {
    var fruitNames = [
      "apple",
      "banana",
      "lemon",
      "mango",
      "orange_fruit",
      "pineapple",
      "strawberry",
      "watermelon"
    ]
    
    if let allPurchasedProductIdentifiers = Purchases.shared.cachedCustomerInfo?.allPurchasedProductIdentifiers,
       allPurchasedProductIdentifiers.count > 0 {
      // Premium.
      fruitNames += [
        "cherry",
        "coconut",
        "durian",
        "grapes",
        "guava",
        "kiwi",
        "lime",
        "lychee",
        "passion-fruit"
      ]
    }
    
    let fruits: [Fruit] = fruitNames.map { name in
      return .init(title: name.uppercased(), image: Image(name))
    }
    return fruits
  }
}
