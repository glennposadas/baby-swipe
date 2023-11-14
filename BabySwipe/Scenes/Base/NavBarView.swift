//
//  NavBarView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 11/4/23.
//

import SwiftUI

struct NavBarView<Content>: View where Content: View {
  
  let content: () -> Content
  let homeTapped: () -> (Void)
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          Rectangle()
            .overlay {
              ZStack {
                Color.bgColor
                VStack {
                  Spacer()
                  
                  ZStack {
                    HStack(alignment: .center) {
                      
                      Button(action: homeTapped,
                             label: {
                        Image(systemName: "house.circle")
                          .font(.largeTitle)
                          .foregroundStyle(Color.white)
                      })
                      .padding(.leading, 16)
                      
                      Spacer()
                    }
                    
                    Image("MainLogo")
                      .resizable()
                      .scaledToFit()
                      .frame(height: 50, alignment: .center)
                      .padding(.bottom, 20)
                    
                    Spacer()
                  }
                  
                }
              }
            }
            .ignoresSafeArea()
            .frame(height: 70)
          
          Spacer()
        }
        
        content()
          .padding(.top, 70)
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationViewStyle(StackNavigationViewStyle())
      .shadow(radius: 5)
    }
  }
}

#Preview {
  NavBarView {
    List(1..<21, id: \.self) { number in
        Text("Content, \(number)")
    }
  } homeTapped: {
    debugPrint("Home tapped")
  }
}
