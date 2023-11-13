//
//  HomeView.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/23/23.
//

import Lottie
import SwiftUI

struct HomeView: View {
  
  // MARK: -
  // MARK: Properties
  
  @Environment(\.dismiss) var dismiss
  
  @State private var selectedCategory: Category = .animals
  @State private var presentGame: Bool = false
  
  private var categories = Category.all
  
  // MARK: -
  // MARK: Body
  
  var body: some View {
    ZStack {
      NavBarView {
        contentView
      } homeTapped: {
        dismiss()
      }
    }
  }
  
  var contentView: some View {
    ZStack(alignment: .bottom) {
      Image("BGImage")
        .resizable()
        .scaledToFill()
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
      
      ScrollView {
        ForEach(categories, id: \.self) { category in
          Button(action: {
            selectedCategory = category
            presentGame.toggle()
            debugPrint("Selected \(selectedCategory.title)")
          }) {
            Cell(category: category)
              .background(content: {
                Color.red
              })
              .shadow(color: Color.primary.opacity(0.3), radius: 1)
              .padding(.all, 6)
              .frame(width: UIScreen.main.bounds.width - 30, height: 150)
          }
        }
      } // ScrollView
      .padding(.init(top: 0, leading: 0, bottom: 60, trailing: 0))
      
      //      AdMobRectangleView(adBannerType: .home)
    }
    .fullScreenCover(isPresented: $presentGame) {
      debugPrint("Dismiss game")
    } content: {
      GameView(category: $selectedCategory, cards: [])
    }
  }
}

#Preview {
  HomeView()
}
