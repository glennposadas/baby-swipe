//
//  HomeView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/3/23.
//

import Lottie
import RevenueCat
import RevenueCatUI
import SwiftUI

struct HomeView: View {
  
  // MARK: -
  // MARK: Properties
  
  @State private var isAnimating = false
  @State private var presentSettings = false
  
  @AppStorage("mainSoundSettingIsOn") var mainSoundSettingIsOn = false
  
  var onPlay: (() -> Void)?
  
  // MARK: -
  // MARK: Functions
  
  var body: some View {
    ZStack {
      Color.bgColor
      
      ZStack {
        
        // Clouds
        VStack {
          LottieView(animation: .named("clouds"))
            .looping()
            .offset(y: (UIScreen.main.bounds.height * -0.10))
          
          HStack {
            ZStack {
              ForEach(1...7, id: \.self) { index in
                AnimatedCharacterView(index: index)
              }
            }
          }
        }
        
        VStack(spacing: 50) {
          // Main logo
          Image("MainLogo")
            .scaleEffect(isAnimating ? 1.2 : 0.9) // Inflate and deflate
            .animation(
              Animation.easeInOut(duration: 1.0)
                .repeatForever(autoreverses: true),
              value: UUID()
            )
            .onAppear {
              isAnimating = true
            }
          
          // Play
          Button(action: {
            print("Play")
            onPlay?()
          }) {
            HStack {
              Spacer()
              Text("PLAY")
                .font(.custom("Kinderland", size: 50))
                .foregroundStyle(.white)
              Spacer()
            }
            .padding(.horizontal, 20)
            .cornerRadius(30)
            .frame(width: 300, height: 60)
            .overlay(
              RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: 2)
            )
          }
          .buttonStyle(BorderlessButtonStyle())
          
        }
        .offset(x: 0, y: -40)
        
        // Sound
        VStack {
          HStack {
            Spacer()
            
            Button(action: {
              mainSoundSettingIsOn.toggle()
              playBGMusic()
            }) {
              ZStack {
                Circle()
                  .fill(Color.bgColor)
                  .frame(width: 50, height: 50)
                  .overlay(
                    Image(systemName: "gearshape.circle.fill")
                      .font(.largeTitle)
                      .foregroundColor(.white)
                      .aspectRatio(contentMode: .fill)
                  )
              }
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.trailing, 16)
            .padding(.top, 8)
          }
          .padding(.top, 30)
          
          Spacer()
        }
        
      }
    }
    .presentPaywallIfNeeded { customerInfo in
      return customerInfo.entitlements.active.isEmpty
    } purchaseCompleted: { customerInfo in
      debugPrint("Purchase completed: \(customerInfo.entitlements)")
    } restoreCompleted: { customerInfo in
      debugPrint("Purchases restored: \(customerInfo.entitlements)")
    }
    .onAppear {
      playBGMusic()
    }
    .edgesIgnoringSafeArea(.all)
  }
  
  // MARK: -
  // MARK: Functions
  
  private func playBGMusic() {
    mainSoundSettingIsOn ? SFX.shared.playMusic(.bgMusic) : SFX.shared.stopCurrentMusic()
  }
}

#Preview {
  HomeView()
}
