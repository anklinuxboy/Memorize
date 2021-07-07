//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  
  private static let smileys = ["🤓", "😉", "😂", "😛", "🥳", "😃", "😀", "😄", "😆", "😅", "🤣", "🤕",
                "🥲", "☺️", "😇", "🙃", "😌", "😍", "😘", "🧐", "🤪", "😜", "🥸", "😡"]
  private static let vehicleEmojis = ["🚗", "🚙", "🏎", "🚕", "🚌", "🚎", "🚓", "🚑", "🚐", "🛻", "🚘", "🏍",
                   "🚍", "🛴", "🛵", "🚛", "🚁", "✈️", "🚡", "🛺", "🚀", "🛶", "🛸", "🚢"]
  private static let flagEmojis = ["🇦🇺", "🇦🇫", "🇧🇩", "🇨🇦", "🇨🇮", "🇮🇳", "🇺🇸", "🏁", "🇦🇹", "🇧🇴", "🇪🇬", "🇯🇵",
                    "🏴‍☠️", "🇩🇪", "🇮🇹", "🇮🇩", "🇬🇧", "🇳🇴"]

  @Published private var model: MemoryGame<String> = MemoryGame<String>(numbersOfPairsOfCards: 4) { pairIndex in smileys[pairIndex] }
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  //MARK: - Intent(s)
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
