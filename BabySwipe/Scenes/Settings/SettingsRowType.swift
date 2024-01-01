//
//  SettingsRowType.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 1/2/24.
//

import SwiftUI

enum SettingsRowType: Int, CaseIterable {
  case bgMusic = 0
  case goPremium
  case about
  
  var title: String{
    switch self {
    case .bgMusic:
      return "Play Music"
    case .about:
      return "About"
    case .goPremium:
      return "Go Premium"
    }
  }
  
  var sfSymbol: String{
    switch self {
    case .bgMusic:
      return "music.mic.circle"
    case .about:
      return "info.circle"
    case .goPremium:
      return "star.circle"
    }
  }
}

