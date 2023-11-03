//
//  IntroView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/3/23.
//

import Lottie
import SwiftUI

struct IntroView: View {
  
  // MARK: -
  // MARK: Properties
  
  @State private var isAnimating = false
  
  @AppStorage("mainSoundSettingIsOn") var mainSoundSettingIsOn = false
  
  var onPlay: (() -> Void)?
  
  // MARK: -
  // MARK: Functions
  
  var body: some View {
    ZStack {
      Color(.init(named: "BGColor")!)
      
      ZStack {
        
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
          
          Button(action: {
            print("heeeey")
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
                  .fill(Color(.init(named: "BGColor")!))
                  .frame(width: 60, height: 60)
                  .overlay(
                    Image(systemName: mainSoundSettingIsOn ? "speaker.wave.1.fill" : "speaker.slash.fill")
                      .font(.system(size: 30))
                      .foregroundColor(.white)
                      .aspectRatio(contentMode: .fill)
                  )
                  .overlay(
                    RoundedRectangle(cornerRadius: 30)
                      .stroke(Color.white, lineWidth: 2)
                  )
              }
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.trailing, 16)
            .padding(.top, 16)
          }
          .offset(x: 0, y: 20) // Adjust the offset as needed
          Spacer()
        }

      }
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
  IntroView()
}
