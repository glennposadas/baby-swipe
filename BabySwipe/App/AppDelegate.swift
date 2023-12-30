//
//  AppDelegate.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/2/23.
//

import Firebase
import GoogleMobileAds
import RevenueCat
import SwiftUI

var isIpad = UIDevice.current.userInterfaceIdiom == .pad

class AppDelegate: NSObject, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    FirebaseApp.configure()
    
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    
    let ass = AppKeys.revCatAPIKey
    
    Purchases.logLevel = .debug
    
    print("didFinishLaunchingWithOptions...")
    return true
  }
  
}
