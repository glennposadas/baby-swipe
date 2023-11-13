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
        .blur(radius: 2.0)
        .scaledToFill()
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
      
      scrollView()
        .padding(.init(top: 0, leading: 0, bottom: 60, trailing: 0))
      
      //      AdMobRectangleView(adBannerType: .home)
    }
    .fullScreenCover(isPresented: $presentGame) {
      debugPrint("Dismiss game")
    } content: {
      GameView(category: $selectedCategory, cards: [])
    }
  }
  
  private func scrollView() -> some View {
    if #available(iOS 17.0, *) {
      return ScrollView {
        ForEach(categories, id: \.self) { category in
          cell(for: category)
        }
      } // ScrollView
      .scrollTargetBehavior(.viewAligned)
      .scrollIndicators(.hidden)
      
    } else {
      return ScrollView {
        ForEach(categories, id: \.self) { category in
          cell(for: category)
        }
      } // ScrollView
    }
  }
  
  private func cell(for category: Category) -> some View {
    if #available(iOS 17.0, *) {
      return Button(action: {
        selectedCategory = category
        presentGame.toggle()
        debugPrint("Selected \(selectedCategory.title)")
      }) {
        Cell(category: category)
          .frame(width: UIScreen.main.bounds.width - 16, height: 200)
          .scrollTransition(.interactive,
                            axis: .vertical) { effect, phase in
            effect
              .scaleEffect(phase.isIdentity ? 1 : 0.8)
          }
      }
      .padding(.vertical, 5)
      
    } else {
      return Button(action: {
        selectedCategory = category
        presentGame.toggle()
        debugPrint("Selected \(selectedCategory.title)")
      }) {
        Cell(category: category)
          .frame(width: UIScreen.main.bounds.width - 16, height: 180)
      }
      .padding(.vertical, 10)
    }
  }
}

#Preview {
  HomeView()
}
