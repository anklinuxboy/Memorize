//
//  ContentView.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/9/21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    VStack {
      Text(viewModel.title)
        .foregroundColor(viewModel.color)
        .font(.title)
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(viewModel.cards) { card in
            CardView(card: card)
              .aspectRatio(2/3, contentMode: .fit)
              .onTapGesture {
                viewModel.choose(card)
              }
          }
        }
      }
      .foregroundColor(viewModel.color)
      .padding(.horizontal)
      Spacer()
      Button("New Game") {
        viewModel.chooseTheme()
      }
      .font(.title)
    }
  }
}

struct CardView: View {
  let card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if card.isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else if card.isMatched {
        shape.opacity(0)
      } else {
        shape.fill()
      }
    }
  }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      let game = EmojiMemoryGame()
      Group {
        ContentView(viewModel: game)
          .preferredColorScheme(.dark)
      }
    }
}
