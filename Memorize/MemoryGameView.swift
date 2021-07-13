//
//  ContentView.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/9/21.
//

import SwiftUI

struct MemoryGameView: View {
  @ObservedObject var game: EmojiMemoryGame
  
  var body: some View {
    VStack {
      Text("\(game.title): \(game.score)")
        .foregroundColor(game.color)
        .font(.title)
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(game.cards) { card in
            CardView(card: card)
              .aspectRatio(2/3, contentMode: .fit)
              .onTapGesture {
                game.choose(card)
              }
          }
        }
      }
      .foregroundColor(game.color)
      .padding(.horizontal)
      Spacer()
      Button("New Game") {
        game.chooseTheme()
      }
      .font(.title)
    }
  }
}

struct CardView: View {
  let card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        let shape = RoundedRectangle(cornerRadius: 20)
        if card.isFaceUp {
          shape.fill().foregroundColor(.white)
          shape.strokeBorder(lineWidth: 3)
          Text(card.content).font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
        } else if card.isMatched {
          shape.opacity(0)
        } else {
          shape.fill()
        }
      }
    }
  }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      let game = EmojiMemoryGame()
      Group {
        MemoryGameView(game: game)
          .preferredColorScheme(.dark)
      }
    }
}
