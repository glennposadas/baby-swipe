//
//  AppDelegate.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/2/23.
//

import Firebase
import GoogleMobileAds
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    print("didFinishLaunchingWithOptions...")
    return true
  }
  
}
