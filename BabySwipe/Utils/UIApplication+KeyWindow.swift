//
//  UIApplication+KeyWindow.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/15/23.
//

import UIKit

// https://stackoverflow.com/questions/68387187/how-to-use-uiwindowscene-windows-on-ios-15
extension UIApplication {
  var keyWindow: UIWindow? {
    connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }
  }
}

