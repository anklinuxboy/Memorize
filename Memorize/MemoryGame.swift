//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  private(set) var score: Int
  
  private var indexOfOnlyCardShowing: Int? {
    get {
      cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
    }
    set {
      cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
    }
  }
  
  init(numbersOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = []
    // add numberOfPairs x 2 cards to array
    for pairIndex in 0..<numbersOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(content: content, id: pairIndex * 2))
      cards.append(Card(content: content, id: pairIndex * 2 + 1))
    }
    
    cards.shuffle()
    score = 0
  }
  
  mutating func choose(_ card: Card) {
    if let index = cards.firstIndex(where: { $0.id == card.id }),
       !cards[index].isFaceUp,
       !cards[index].isMatched {
      if let shownIndex = indexOfOnlyCardShowing {
        if cards[index].content == cards[shownIndex].content {
          cards[index].isMatched = true
          cards[shownIndex].isMatched = true
          score += 2
        } else {
          if cards[index].isSeen && cards[shownIndex].isSeen {
            score -= 2
          } else if cards[index].isSeen && !cards[shownIndex].isSeen {
            score -= 1
            cards[shownIndex].isSeen = true
          } else if !cards[index].isSeen && cards[shownIndex].isSeen {
            score -= 1
            cards[index].isSeen = true
          } else {
            cards[index].isSeen = true
            cards[shownIndex].isSeen = true
          }
        }
        
        cards[index].isFaceUp.toggle()
      } else {
        indexOfOnlyCardShowing = index
      }
    }
  }
  
  struct Card: Identifiable {
    var isFaceUp = false
    var isMatched = false
    var content: CardContent
    var isSeen = false
    var id: Int
  }
}

extension Array {
  var oneAndOnly: Element? {
    if count == 1 {
      return first
    } else {
      return nil
    }
  }
}
