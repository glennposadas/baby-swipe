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
  
  @State private var selectedCategory: Category = .animals
  @State private var presentGame: Bool = false
  
  private var categories = Category.all
  
  // MARK: -
  // MARK: Body
  
  var body: some View {
    ZStack {
      NavBarView {
        contentView
      }
    }
  }
  
  var contentView: some View {
    ZStack(alignment: .bottom) {
      ScrollView {
        LazyVGrid(columns: Array(repeating: .init(.flexible()),
                                 count: UIDevice.current.userInterfaceIdiom == .pad ? 4 : 2)) {
          ForEach(categories, id: \.self) { category in
            Button(action: {
              selectedCategory = category
              presentGame.toggle()
              debugPrint("Selected \(selectedCategory.title)")
            }) {
              Cell(category: category)
                .scaledToFill()
                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                .overlay(
                  RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 3)
                )
                .padding(.all, 6)
            }
          } // ForEach
        } // LazyVGrid
      } // ScrollView
      .padding(.init(top: 10, leading: 0, bottom: 60, trailing: 0))
      
      //      AdMobRectangleView(adBannerType: .home)
    }
    .fullScreenCover(isPresented: $presentGame) {
      debugPrint("Dismiss game")
    } content: {
      GameView(category: $selectedCategory)
    }
  }
}

#Preview {
  HomeView()
}
