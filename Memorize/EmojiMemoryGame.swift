//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import SwiftUI

class EmojiMemoryGame {
  
  private static let smileys = ["🤓", "😉", "😂", "😛", "🥳", "😃", "😀", "😄", "😆", "😅", "🤣", "🤕",
                "🥲", "☺️", "😇", "🙃", "😌", "😍", "😘", "🧐", "🤪", "😜", "🥸", "😡"]

  private var model: MemoryGame<String> = MemoryGame<String>(numbersOfPairsOfCards: 4) { pairIndex in smileys[pairIndex] }
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
}
