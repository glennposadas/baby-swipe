//
//  GameView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/5/23.
//

import Lottie
import SwiftUI

struct GameView: View {
  
  // MARK: -
  // MARK: Properties
  
  @Environment(\.dismiss) var dismiss
  @State private var isShowingExitConfirmation = false

  // MARK: -
  // MARK: Body
  
  var body: some View {
    ZStack {
      Color.bgColor
      
      // Background
      Image("BGImage")
        .resizable()
        .scaledToFill()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
      
      // Button
      VStack {
        Button(action: {
          isShowingExitConfirmation = true
        }, label: {
          Image(systemName: "xmark.circle.fill")
            .font(.system(size: 40))
        })
        .background(content: {
          Color.red
        })
        .foregroundStyle(Color.white)
        .frame(width: 60, height: 60, alignment: .leading)
        .shadow(radius: 10)
        .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 0))
        
        Spacer()
      }
      
    }
    .ignoresSafeArea()
    .alert(isPresented: $isShowingExitConfirmation) {
      Alert(
        title: Text("Are you sure you want to exit the game?"),
        primaryButton: .default(Text("Yes")) {
          debugPrint("Exiting the game")
          dismiss()
        },
        secondaryButton: .cancel()
      )
    }
  }
}

#Preview {
  GameView()
}
