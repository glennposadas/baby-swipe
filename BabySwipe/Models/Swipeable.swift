//
//  Swipeable.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/6/23.
//

import SwiftUI

class Swipeable {
  
  // MARK: -
  // MARK: Properties
  
  var title: String = ""
  var image: Image
  
  // MARK: -
  // MARK: Functions
  
  init(title: String, image: Image) {
    self.title = title
    self.image = image
  }
}
