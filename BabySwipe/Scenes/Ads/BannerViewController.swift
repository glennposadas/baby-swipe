//
//  BannerViewController.swift
//  BabyVision
//
//  Created by Glenn Posadas on 10/16/23.
//

import GoogleMobileAds
import SwiftUI

protocol BannerViewControllerWidthDelegate: AnyObject {
  func bannerViewController(_ bannerViewController: BannerViewController, didUpdate width: CGFloat)
}

class BannerViewController: UIViewController, GADBannerViewDelegate {
  weak var delegate: BannerViewControllerWidthDelegate?
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // Tell the delegate the initial ad width.
    delegate?.bannerViewController(
      self, didUpdate: view.frame.inset(by: view.safeAreaInsets).size.width)
  }
  
  override func viewWillTransition(
    to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator
  ) {
    coordinator.animate { _ in
      // do nothing
    } completion: { _ in
      // Notify the delegate of ad width changes.
      self.delegate?.bannerViewController(
        self, didUpdate: self.view.frame.inset(by: self.view.safeAreaInsets).size.width)
    }
  }
  
  // MARK: -
  // MARK: GADBannerViewDelegate
  
  func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
    debugPrint("bannerViewDidReceiveAd --> \(String(describing: bannerView.adUnitID))")
  }
  
  func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
    debugPrint("didFailToReceiveAdWithError --> \(String(describing: bannerView.adUnitID)): \(error)")
  }
}

struct BannerView: UIViewControllerRepresentable {
  @State var viewWidth: CGFloat! = 320
  private let bannerView = GADBannerView()
  private var adUnitID = ""
  
  init(viewWidth: CGFloat, adBannerType: AdBannerType) {
    self.viewWidth = viewWidth
    
    var type = adBannerType
    
#if DEBUG
    debugPrint("Debug, assigning test admob unit id")
    type = .test
#endif
    
    adUnitID = type.rawValue
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    let bannerViewController = BannerViewController()
    bannerView.adUnitID = adUnitID
    bannerView.rootViewController = bannerViewController
    bannerView.delegate = bannerViewController
    bannerViewController.view.addSubview(bannerView)
    
    return bannerViewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    guard viewWidth != .zero else { return }
    
    // Request a banner ad with the updated viewWidth.
    bannerView.adSize = GADAdSizeFromCGSize(.init(width: viewWidth, height: isIpad ? 100 : 50))
    bannerView.load(GADRequest())
  }
}
