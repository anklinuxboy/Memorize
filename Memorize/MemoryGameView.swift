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
      AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
        if card.isMatched && !card.isFaceUp {
          Rectangle().opacity(0)
        } else {
          CardView(card: card)
            .onTapGesture {
              game.choose(card)
            }
            .padding(4)
        }
      })
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
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        if card.isFaceUp {
          shape.fill().foregroundColor(.white)
          shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
          Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90)).padding(5).opacity(0.4)
          Text(card.content).font(font(in: geometry.size))
        } else if card.isMatched {
          shape.opacity(0)
        } else {
          shape.fill()
        }
      }
    }
  }
  
  private func font(in size: CGSize) -> Font {
    Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
  }
  
  private struct DrawingConstants {
    static let cornerRadius: CGFloat = 10
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.75
  }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      let game = EmojiMemoryGame()
      game.choose(game.cards.first!)
      return Group {
        MemoryGameView(game: game)
      }
    }
}
