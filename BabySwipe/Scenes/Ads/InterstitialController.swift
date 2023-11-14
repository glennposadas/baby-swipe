//
//  InterstitialController.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/15/23.
//

import Foundation
import GoogleMobileAds

class InterstitialController: NSObject, GADFullScreenContentDelegate, ObservableObject {
  
  // Properties
  @Published var interstitialAdLoaded:Bool = false
  var interstitialAd:GADInterstitialAd?
  
  override init() {
    super.init()
  }
  
  // Load InterstitialAd
  func loadInterstitialAd(){
    var type: AdInterstitialType = .play
    
#if DEBUG
    debugPrint("InterstitialController Debug, assigning test admob unit id")
    type = .test
#endif
    
    GADInterstitialAd.load(withAdUnitID: type.rawValue, request: GADRequest()) { [weak self] add, error in
      guard let self = self else {return}
      if let error = error{
        debugPrint("🔴: InterstitialController \(error.localizedDescription)")
        self.interstitialAdLoaded = false
        return
      }
      debugPrint("🟢: InterstitialController Loading succeeded")
      self.interstitialAdLoaded = true
      self.interstitialAd = add
      self.interstitialAd?.fullScreenContentDelegate = self
    }
  }
  
  // Display InterstitialAd
  func displayInterstitialAd() {
    // TODO:
    guard let root = UIApplication.shared.windows.last?.rootViewController else {
      return
    }
    if let add = interstitialAd{
      add.present(fromRootViewController: root)
      interstitialAdLoaded = false
    }else{
      debugPrint("🔵: InterstitialController Ad wasn't ready")
      interstitialAdLoaded = false
      loadInterstitialAd()
    }
  }
  
  // Failure notification
  func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
    debugPrint("🟡: InterstitialController Failed to display interstitial ad: \(error.localizedDescription)")
    loadInterstitialAd()
  }
  
  // Indicate notification
  func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    debugPrint("🤩: InterstitialController Displayed an interstitial ad")
    interstitialAdLoaded = false
  }
  
  // Close notification
  func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    debugPrint("😔: InterstitialController ad closed")
  }
}
