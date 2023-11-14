//
//  Number.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import SwiftUI

class Number: Swipeable {

  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Number] {
    let numbers: [Number] = (1...10).map { number in
      let title = "\(number)"
      return Number(title: title, image: .init(title))
    }
    
    return numbers
  }
}

