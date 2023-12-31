//
//  CategoriesView.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/23/23.
//

import Lottie
import RevenueCat
import SwiftUI

struct CategoriesView: View {
  
  // MARK: -
  // MARK: Properties
  
  @Environment(\.dismiss) var dismiss
  
  @State private var selectedCategory: Category = .animals
  @State private var presentGame: Bool = false
  
  @StateObject private var interstitialController = InterstitialController()
  
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
      Color.black
      Image("BGImage")
        .resizable()
        .blur(radius: 2.0)
        .scaledToFill()
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
      
      scrollViewWithModifier()
      
      if Purchases.shared.cachedCustomerInfo?.allPurchasedProductIdentifiers.count == 0 {
        AdMobRectangleView(adBannerType: .home)
      }
    }
    .fullScreenCover(isPresented: $presentGame) {
      debugPrint("Dismiss game")
      interstitialController.displayInterstitialAd()
    } content: {
      GameView(category: $selectedCategory, cards: [])
    }
    .onAppear {
      debugPrint("On Appear, categories view")
      
      if Purchases.shared.cachedCustomerInfo?.allPurchasedProductIdentifiers.count == 0 {
        interstitialController.loadInterstitialAd()
      }
    }
  }
  
  private func scrollViewWithModifier() -> some View {
    if #available(iOS 17.0, *) {
      return scrollView()
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
      
    } else {
      return scrollView()
    }
  }
  
  private func scrollView() -> some View {
    return ScrollView {
      Spacer().frame(height: 30)
      
      ForEach(categories, id: \.title) { category in
        cellWithModifier(for: category)
          .frame(width: UIScreen.main.bounds.width - (isIpad ? 80 : 30), height: isIpad ? 400 : 180)
          .padding(.vertical, isIpad ? 50 : 16)

      }
      
      Spacer().frame(height: 100)
    }
  }
  
  private func cellWithModifier(for category: Category) -> some View {
    return Button(action: {
      selectedCategory = category
      presentGame.toggle()
      debugPrint("Selected \(selectedCategory.title)")
    }) {
      cell(for: category)
    }
  }
  
  private func cell(for category: Category) -> some View {
    if #available(iOS 17.0, *) {
      return Cell(category: category)
        .scrollTransition(.interactive,
                          axis: .vertical) { effect, phase in
          effect
            .scaleEffect(phase.isIdentity ? 1 : 0.8)
        }
    } else {
      return Cell(category: category)
    }
  }
}

#Preview {
  CategoriesView()
}
