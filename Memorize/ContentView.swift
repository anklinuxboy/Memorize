//
//  ContentView.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/9/21.
//

import SwiftUI

struct ContentView: View {
  private let smileys = ["🤓", "😉", "😂", "😛", "🥳", "😃", "😀", "😄", "😆", "😅", "🤣", "🤕",
                "🥲", "☺️", "😇", "🙃", "😌", "😍", "😘", "🧐", "🤪", "😜", "🥸", "😡"]
  private let vehicleEmojis = ["🚗", "🚙", "🏎", "🚕", "🚌", "🚎", "🚓", "🚑", "🚐", "🛻", "🚘", "🏍",
                   "🚍", "🛴", "🛵", "🚛", "🚁", "✈️", "🚡", "🛺", "🚀", "🛶", "🛸", "🚢"]
  private let flagEmojis = ["🇦🇺", "🇦🇫", "🇧🇩", "🇨🇦", "🇨🇮", "🇮🇳", "🇺🇸", "🏁", "🇦🇹", "🇧🇴", "🇪🇬", "🇯🇵",
                    "🏴‍☠️", "🇩🇪", "🇮🇹", "🇮🇩", "🇬🇧", "🇳🇴"]
  
  @State var emojis: [String] = ["🤓", "😉", "😂", "😛", "🥳", "😃", "😀", "😄", "😆", "😅", "🤣", "🤕",
                                 "🥲", "☺️", "😇", "🙃", "😌", "😍", "😘", "🧐", "🤪", "😜", "🥸", "😡"]
  @State var emojiCount = 4
  
  var body: some View {
    VStack {
      Text("Memorize!")
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
          ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
            CardView(content: emoji)
              .aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.red)
      Spacer()
      HStack {
        faceTheme
        Spacer()
        vehicleTheme
        Spacer()
        flagTheme
      }
      .padding(.horizontal)
      .font(.body)
      .foregroundColor(.blue)
    }
    .padding(.horizontal)
    .onAppear {
      emojis = smileys
    }
  }
  
  var faceTheme: some View {
    Button {
      emojis = smileys.shuffled()
    } label: {
      VStack {
        Image(systemName: "face.smiling.fill")
        Text("Smileys")
      }
    }
  }
  
  var vehicleTheme: some View {
    Button {
      emojis = vehicleEmojis.shuffled()
    } label: {
      VStack {
        Image(systemName: "car.fill")
        Text("Vehicles")
      }
    }
  }
  
  var flagTheme: some View {
    Button {
      emojis = flagEmojis.shuffled()
    } label: {
      VStack {
        Image(systemName: "flag.fill")
        Text("Flags")
      }
    }
  }
}

struct CardView: View {
  var content: String
  @State var isFaceup: Bool = true
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if isFaceup {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }
    .onTapGesture {
      isFaceup = !isFaceup
    }
  }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
          .preferredColorScheme(.dark)
        ContentView()
          .preferredColorScheme(.light)
      }
    }
}
