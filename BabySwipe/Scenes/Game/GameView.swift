//
//  GameView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/5/23.
//

import Lottie
import SwiftUI

typealias Card = CardView<CardContainerView>

struct GameView: View {
  
  // MARK: -
  // MARK: Properties
  
  @Environment(\.dismiss) var dismiss
  @State private var isShowingExitConfirmation = false
  @Binding var category: Category
  
  @State var cards: [Card]
  
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
        ZStack {
          ForEach(cards, id: \.tagId) { card in
            updateCard(card)
          }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20.0)
        
        Spacer()
        Spacer()
        Spacer()
      }
      .padding(.top, 30)
    }
    .ignoresSafeArea()
    .onAppear {
      SFX.shared.playMusic(.gaming)
      loadCards()
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
  
  private func updateCard(_ card: Card) -> some View {
    card
      .animation(.spring(), value: UUID())
      .zIndex(Double(cards.count - card.index))
      .offset(x: 0, y: 10 + CGFloat(card.index) * 10)
      .rotationEffect(.degrees(-(Double(card.index)) * 0.7))
  }
  
  private func getCards() -> [Card] {
    var cards: [Card] = []
    for (index, data) in category.allData.enumerated() {
      cards.append(
        .init(
          index: index,
          tagId: UUID(),
          swipedLeft: onSwipeLeft(_:),
          swipedRight: onSwipeRight(_:),
          content: { CardContainerView(data: data) }
        )
      )
    }
    
    return cards
  }
  
  private func loadCards() {
    cards = getCards()
  }
  
  private func onSwipeLeft(_ tagId: UUID) {
    debugPrint("onSwipeLeft: \(tagId)")
    shouldResetCards(tagId)
  }
  
  private func onSwipeRight(_ tagId: UUID) {
    debugPrint("onSwipeRight: \(tagId)")
    shouldResetCards(tagId)
  }
  
  // Check if we are on the last card.
  private func shouldResetCards(_ tagId: UUID) {
    // Get the last uuid
    guard let lastUUID = cards.last?.tagId else {
      return
    }
    
    if tagId == lastUUID {
      debugPrint("Last card reached. Resetting...")
      loadCards()
    }
  }
}

#Preview {
  GameView(category: .constant(.colors), cards: [])
}
