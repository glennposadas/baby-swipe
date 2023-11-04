//
//  AdMobRectangleView.swift
//  BabyVision
//
//  Created by Glenn Posadas on 10/19/23.
//

import GoogleMobileAds
import SwiftUI

struct AdMobRectangleView: View {
  @State var adBannerType: AdBannerType! = .home
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: UIScreen.main.bounds.width, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      BannerView(viewWidth: 320, adBannerType: adBannerType)
        .edgesIgnoringSafeArea(.bottom)
        .frame(width: 320, height: 50, alignment: .center)
    }
  }
}
