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
    // Get connected scenes
    return self.connectedScenes
    // Keep only active scenes, onscreen and visible to the user
      .filter { $0.activationState == .foregroundActive }
    // Keep only the first `UIWindowScene`
      .last(where: { $0 is UIWindowScene })
    // Get its associated windows
      .flatMap({ $0 as? UIWindowScene })?.windows
    // Finally, keep only the key window
      .last(where: \.isKeyWindow)
  }
}

