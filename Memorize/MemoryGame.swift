//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import Foundation

struct MemoryGame<CardContent> {
  private(set) var cards: Array<Card>
  
  init(numbersOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    // add numberOfPairs x 2 cards to array
    for pairIndex in 0..<numbersOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  func choose(_ card: Card) {
    
  }
  
  struct Card {
    var isFaceUp = false
    var isMatched = false
    var content: CardContent
  }
}
