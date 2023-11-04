//
//  NavBarView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/4/23.
//

import SwiftUI

struct NavBarView<Content>: View where Content: View {
  
  let title: String
  let content: Content
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          Rectangle()
            .overlay {
              Color.bgColor
            }
            .frame(height: 100)
            .edgesIgnoringSafeArea(.all)
          Spacer()
        }
        content
      }
      .navigationBarTitle(title, displayMode: .inline)
    }
  }
}

#Preview {
  NavBarView(title: "MY GAMES", content: Text("Hello!"))
}
