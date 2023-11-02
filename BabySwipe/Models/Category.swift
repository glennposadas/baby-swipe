//
//  Category.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/3/23.
//

import SwiftUI

enum Category: String {
  case animals
  case colors
  case fruits
  case letters
  case numbers
  case shapes
  
  var title: String {
    rawValue.capitalized
  }
  
  var icon: Image {
    Image("\(rawValue)")
  }
}
