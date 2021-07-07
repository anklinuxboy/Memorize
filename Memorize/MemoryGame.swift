//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  
  private(set) var indexOfOnlyCardShowing: Int?
  
  init(numbersOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    // add numberOfPairs x 2 cards to array
    for pairIndex in 0..<numbersOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(content: content, id: pairIndex * 2))
      cards.append(Card(content: content, id: pairIndex * 2 + 1))
    }
  }
  
  mutating func choose(_ card: Card) {
    if let index = cards.firstIndex(where: { $0.id == card.id }),
       !cards[index].isFaceUp,
       !cards[index].isMatched {
      if let shownIndex = indexOfOnlyCardShowing {
        if cards[index].content == cards[shownIndex].content {
          cards[index].isMatched = true
          cards[shownIndex].isMatched = true
        }
        
        indexOfOnlyCardShowing = nil
      } else {
        for i in cards.indices {
          cards[i].isFaceUp = false
        }
        
        indexOfOnlyCardShowing = index
      }
      cards[index].isFaceUp.toggle()
    }
  }
  
  struct Card: Identifiable {
    var isFaceUp = false
    var isMatched = false
    var content: CardContent
    var id: Int
  }
}
