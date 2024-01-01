//
//  AboutView.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 1/2/24.
//

import SwiftUI

struct AboutView: View {
  
  // MARK: -
  // MARK: Properties
  
  @Environment(\.dismiss) var dismiss
  

  @State private var scrollOffset: CGFloat = 0
  
  // MARK: -
  // MARK: Body
  
  var body: some View {
    ZStack {
      Color.white
      
      ScrollView {

        VStack(spacing: 30) {

          Spacer()
          
          BlurView(text: "Baby Swipe", textSize: 44, startTime: 0.41)
            .padding(.top, 30)
          
          Text("""
          Your baby's and kid's first flashcard app.

          Welcome to "Learn & Play," a delightful educational app designed for curious little minds! Engage your baby or toddler in an interactive world of discovery with our vibrant flashcards featuring fruits, animals, numbers, letters, shapes, and colors.


          Key Features:


            👉 Fruit Fiesta: Explore the world of fruits with colorful and interactive cards. From apples to watermelons, your little one will learn about different fruits in a fun and engaging way.


            👉 Animal Adventure: Dive into a zoo of learning! Our animal flashcards introduce your child to a variety of creatures, each accompanied by delightful sounds and interesting facts.


            👉 123s & ABCs: Lay the foundation for early literacy and numeracy skills. Watch as your toddler learns the alphabet and numbers through captivating visuals and cheerful narration.


            👉 Shapes & Colors Wonderland: Spark creativity with cards showcasing various shapes and a vibrant spectrum of colors. Encourage your child's imagination while learning the building blocks of visual recognition.


          Why Choose "Learn & Play"?


          Interactive Learning: Our app offers hands-on engagement, fostering an enjoyable learning experience for your little one.


          Visual Delight: Immerse your child in a world of vibrant colors, cute animations, and captivating illustrations that enhance the learning process.


          Designed for Babies & Toddlers: Created with the developmental needs of young minds in mind, "Learn & Play" is perfect for babies and toddlers alike.


          Parental Guidance: Enjoy quality bonding time with your child as you explore together and witness their joy in discovering new things.
          """)
          .padding()
          
          Spacer()
          
          Button(action: {
            dismiss()
          }, label: {
            Text("Get Started")
          })
          .frame(width: 320, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .background(Color.bgColor)
          .foregroundStyle(.white)
          .cornerRadius(10)
          .shadow(radius: 5)
          
          Spacer()
          
        }
      }
      
    }
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      let totalWidth = CGFloat(32) * (80 + 20) - 20
      withAnimation(Animation.linear(duration: 100).repeatForever(autoreverses: true)) {
        scrollOffset = -totalWidth
      }
    }
  }
}

struct ThumbnailView: View {
  let imageName: String // Replace with your image loading logic
  
  var body: some View {
    Image(imageName)
      .resizable()
      .frame(width: 100, height: 100)
      .cornerRadius(10)
      .shadow(radius: 5)
  }
}

struct BlurView: View {
  let characters: Array<String.Element>
  let baseTime: Double
  let textSize: Double
  @State var blurValue: Double = 10
  @State var opacity: Double = 0
  
  init(text:String, textSize: Double, startTime: Double) {
    characters = Array(text)
    self.textSize = textSize
    baseTime = startTime
  }
  
  var body: some View {
    
    HStack(spacing: 1) {
      ForEach(0..<characters.count, id: \.self) { num in
        Text(String(self.characters[num]))
          .font(.largeTitle)
          .fontWeight(.bold)
          .blur(radius: blurValue)
          .opacity(opacity)
          .animation(.easeInOut.delay( Double(num) * 0.15 ),
                     value: blurValue)
      }
    }
    .onAppear{
      DispatchQueue.main.asyncAfter(deadline: .now() + baseTime) {
        if blurValue == 0{
          blurValue = 10
          opacity = 0.01
        } else {
          blurValue = 0
          opacity = 1
        }
      }
    }
  }
}

#Preview {
  AboutView()
}
