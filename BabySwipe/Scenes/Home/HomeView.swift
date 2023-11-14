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
      }.navigationViewStyle(StackNavigationViewStyle())
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
        Spacer().frame(height: 30)
        
        ForEach(categories, id: \.title) { category in
          cell(for: category)
            .frame(width: UIScreen.main.bounds.width - (isIpad ? 80 : 30), height: isIpad ? 300 : 180)
            .padding(.vertical, isIpad ? 40 : 20)

        }
        
        Spacer().frame(height: 180)
        
      } // ScrollView
      .scrollTargetBehavior(.viewAligned)
      .scrollIndicators(.hidden)
      
    } else {
      return ScrollView {
        Spacer().frame(height: 20)

        ForEach(categories, id: \.title) { category in
          cell(for: category)
            .frame(width: UIScreen.main.bounds.width - (isIpad ? 80 : 30), height: isIpad ? 300 : 180)
            .padding(.vertical, isIpad ? 40 : 20)

          Spacer().frame(height: 180)
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
          .scrollTransition(.interactive,
                            axis: .vertical) { effect, phase in
            effect
              .scaleEffect(phase.isIdentity ? 1 : 0.8)
          }
      }

    } else {
      return Button(action: {
        selectedCategory = category
        presentGame.toggle()
        debugPrint("Selected \(selectedCategory.title)")
      }) {
        Cell(category: category)
      }
    }
  }
}

#Preview {
  HomeView()
}
