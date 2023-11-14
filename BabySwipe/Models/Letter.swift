//
//  Letter.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import SwiftUI

class Letter: Swipeable {
  
  // MARK: -
  // MARK: Generator
  
  static func allData() -> [Letter] {
    let letters: [Letter] = (0..<26).map { index in
      let character = Character(UnicodeScalar(UInt8(65 + index))) // 65 is the ASCII value for 'A'
      let title = "\(character)"
      return Letter(title: title, image: .init(title.lowercased()))
    }
    
    return letters
  }
}
