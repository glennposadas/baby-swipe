//
//  CardView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/5/23.
//

import SwiftUI

struct CardView<Content: View>: View {
  
  // MARK: - Properties
  
  @State public var offset = CGSize.zero
  @State public var color: Color = .black
  @State public var isRemoved = false
  @State public var tagId: UUID = UUID()
  var index: Int
  public var swipedLeft: ((_ tag: UUID) -> Void)?
  public var swipedRight: ((_ tag: UUID) -> Void)?
  public var content: () -> Content
  
  // MARK: - Initializer
  
  public init(index: Int,
              tagId: UUID,
              swipedLeft: ((_ tag: UUID) -> Void)? = nil,
              swipedRight: ((_ tag: UUID) -> Void)? = nil,
              @ViewBuilder content: @escaping () -> Content) {
    self.swipedLeft = swipedLeft
    self.swipedRight = swipedRight
    self.content = content
    self.index = index
    self.tagId = tagId
  }
  
  // MARK: - Body
  
  public var body: some View {
    ZStack {
      content()
        .frame(width: 320, height: 420)
    }
    .offset(x: offset.width * 1, y: offset.height * 0.4)
    .rotationEffect(.degrees(Double(offset.width / 10)))
    .gesture(
      DragGesture()
        .onChanged { gesture in
          offset = gesture.translation
        }
        .onEnded { _ in
          withAnimation {
            handleSwipe(width: offset.width)
          }
        }
    )
    .opacity(isRemoved ? 0 : 1) // add this modifier to handle card removal
  }
  
  // MARK: - Methods
  
  public func handleSwipe(width: CGFloat) {
    switch width {
    case -500...(-150):
      swipedLeft?(tagId)
      offset = CGSize(width: -500, height: 0)
      isRemoved = true // set isRemoved to true
      // You can also update the views from here. E.g. colors.
    case 150...500:
      swipedRight?(tagId)
      offset = CGSize(width: 500, height: 0)
      isRemoved = true // set isRemoved to true
      // You can also update the views from here. E.g. colors.
    default:
      offset = .zero
    }
  }
}
