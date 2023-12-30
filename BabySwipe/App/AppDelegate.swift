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
        
    Purchases.logLevel = .debug
    Purchases.configure(withAPIKey: AppKeys.revCatAPIKey, appUserID: AppKeys.revCatAppId)
    
    debugPrint("didFinishLaunchingWithOptions...")
    return true
  }
  
}
