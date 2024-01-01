//
//  SettingsView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 1/2/24.
//

import RevenueCat
import RevenueCatUI
import SwiftUI

struct SettingsView: View {
  
  // MARK: -
  // MARK: Properties
  
  @State private var presentAbout: Bool = false
  @State private var presentPaywall: Bool = false
  
  // MARK: -
  // MARK: Body
  
  var body: some View {
    NavigationView {
      bodyContent
    }.navigationViewStyle(StackNavigationViewStyle())
  }
  
  var bodyContent: some View {
    ZStack {
      Color.white
            
      VStack {
        List {
          SettingsRowView(rowType: .bgMusic)
            .onTapGesture {
              
            }
          SettingsRowView(rowType: .goPremium)
            .onTapGesture {
              presentPaywall.toggle()
            }
          SettingsRowView(rowType: .about)
            .onTapGesture {
              presentAbout.toggle()
            }
        }
        
        AdMobRectangleView(adBannerType: .settings)
      }
    }
    .navigationTitle("Settings")
    .fullScreenCover(isPresented: $presentPaywall, content: {
      PaywallView(displayCloseButton: true)
    })
    .fullScreenCover(isPresented: $presentAbout, content: AboutView.init)
  }
}

struct SettingsRowView: View {
  
  @State var rowType: SettingsRowType!
  @AppStorage("playMusicIsOn") var playMusicIsOn = false

  var body: some View {
    ZStack {
      HStack {
        Label(
          title: { Text(rowType.title) },
          icon: { Image(systemName: rowType.sfSymbol) }
        )
        .foregroundStyle(.black)
        
        if rowType == .bgMusic {
          Toggle(isOn: $playMusicIsOn) {
            
          }
          .onChange(of: playMusicIsOn) { value in
            value ? SFX.shared.playMusic(.bgMusic) : SFX.shared.stopCurrentMusic()
          }
        }
      }
    }
  }
}

#Preview {
  SettingsView()
}

