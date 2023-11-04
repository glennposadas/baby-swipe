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
        VStack(spacing: 0) {
          Rectangle()
            .overlay {
              ZStack {
                Color.bgColor
                VStack {
                  Spacer()
                  Image("MainLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 20)
                }
              }
            }
            .ignoresSafeArea()
            .frame(height: 70)
          
          Spacer()
        }
        
        content
      }
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  NavBarView(title: "MY GAMES", content: Text("Hello!"))
}
