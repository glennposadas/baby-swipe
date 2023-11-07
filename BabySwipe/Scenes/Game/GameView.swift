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
  @Binding var category: Category
  
  // MARK: -
  // MARK: Body
  
  var body: some View {
    ZStack {
      Color.bgColor
      
      // Background
      Image("BGImage")
        .resizable()
        .scaledToFill()
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
      
      HStack(alignment: .center, spacing: 0) {
        VStack {
          Button(action: {
            isShowingExitConfirmation = true
          }, label: {
            Image(systemName: "xmark.circle.fill")
              .font(.system(size: 40))
          })
          .foregroundStyle(Color.white)
          .frame(width: 60, height: 60, alignment: .leading)
          .shadow(radius: 3)
          .padding(.init(top: 20, leading: 20, bottom: 0, trailing: 0))
          
          Spacer()
        }
        
        Spacer()
      }
      
      // Header
      VStack {
        Spacer()
        
        HStack {
          Spacer()
          
          // Main Logo For Banner
          Image("MainLogo")
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 130)
            .padding()
          
          Spacer()
        }
        .padding()
        
        // Subtitle
        Text(category.title.uppercased())
          .font(.custom("Kinderland", size: 18))
          .foregroundStyle(.white)
          .padding(.all, 8)
          .background(
            LinearGradient(gradient: Gradient(colors: [.gradient2, .gradient1]),
                           startPoint: .top,
                           endPoint: .bottom)
          )
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.white, lineWidth: 2)
          )
          .padding(.top, -30)
        
        Spacer()
        
        // Cards
        CardStackView(cards: getCards(), cardAction: {
          debugPrint("Card action")
        }, loopCards: true)
          .padding()
        
        Spacer()
        Spacer()
        Spacer()
      }
      .padding(.top, 30)
    }
    .ignoresSafeArea()
    .onAppear {
      SFX.shared.playMusic(.gaming)
    }
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
  
  // MARK: -
  // MARK: Functions
  
  private func getCards() -> [CardView<CardContainerView>] {
    return category.allData.map { data in
      CardView(content: { CardContainerView(data: data) })
    }
  }
}

#Preview {
  GameView(category: .constant(.animals))
}
