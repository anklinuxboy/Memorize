//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
  
  private static let smileys = ["ðĪ", "ð", "ð", "ð", "ðĨģ", "ð", "ð", "ð", "ð", "ð", "ðĪĢ", "ðĪ", "ðĨē", "âšïļ", "ð", "ð", "ð", "ð", "ð", "ð§", "ðĪŠ", "ð", "ðĨļ", "ðĄ"]
  private static let vehicleEmojis = ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð", "ð", "ðī", "ðĩ", "ð", "ð", "âïļ", "ðĄ", "ðš", "ð", "ðķ", "ðļ", "ðĒ"]
  private static let flagEmojis = ["ðĶðš", "ðĶðŦ", "ð§ðĐ", "ðĻðĶ", "ðĻðŪ", "ðŪðģ", "ðšðļ", "ð", "ðĶðđ", "ð§ðī", "ðŠðŽ", "ðŊðĩ", "ðīââ ïļ", "ðĐðŠ", "ðŪðđ", "ðŪðĐ", "ðŽð§", "ðģðī"]
  private static let activityEmojis = ["â―ïļ", "ð", "ð", "âūïļ", "ðĨ", "ðū", "ð", "ð", "ðĨ", "ðą", "ðŠ", "ð", "ðļ", "ð", "ð"]
  private static let foodEmojis = ["ð", "ð­", "ðŪ", "ðŊ", "ðĨ", "ð", "ð", "ð", "ð", "ðą", "ð", "ðŋ", "ð°", "ð§", "ðŠ"]
  private static let beveragesEmojis = ["ðš", "ð·", "ðļ", "ðđ", "ðĨ", "ðū", "ðĨ", "ðķ", "âïļ", "ðĩ", "ð§", "ðĨĪ", "ðĨ", "ð§", "ð§"]
  
  private static let smileyTheme = GameTheme(name: "Smileys", content: smileys.shuffled(), numberOfPairs: 12, color: Color.yellow)
  private let vehicleTheme = GameTheme(name: "Vehicles", content: vehicleEmojis, numberOfPairs: 6, color: Color.blue)
  private let flagTheme = GameTheme(name: "Flags", content: flagEmojis, numberOfPairs: 8, color: Color.red)
  private let activityTheme = GameTheme(name: "Sports", content: activityEmojis, numberOfPairs: 10, color: Color.orange)
  private let foodTheme = GameTheme(name: "Foods", content: foodEmojis, numberOfPairs: foodEmojis.count, color: Color.purple)
  private let drinkTheme = GameTheme(name: "Drinks", content: beveragesEmojis, numberOfPairs: beveragesEmojis.count, color: Color.pink)
  
  private let themes: [GameTheme<String>]
  private(set) var theme: GameTheme<String>
  @Published private(set) var model: MemoryGame<String>
  
  init() {
    themes = [EmojiMemoryGame.smileyTheme, vehicleTheme, flagTheme, activityTheme, foodTheme, drinkTheme]
    theme = EmojiMemoryGame.smileyTheme
    if theme.numberOfPairs >= theme.content.count {
      theme.numberOfPairs = theme.content.count - 1
    }
    model = MemoryGame<String>(numbersOfPairsOfCards: theme.numberOfPairs) { pairIndex in
      EmojiMemoryGame.smileyTheme.content[pairIndex]
    }
  }
  
  var cards: Array<Card> {
    return model.cards
  }
  
  var color: Color {
    return theme.color
  }
  
  var score: Int {
    return model.score
  }
  
  var title: String {
    return theme.name
  }
  
  //MARK: - Intent(s)
  func choose(_ card: Card) {
    model.choose(card)
  }
  
  func chooseTheme() {
    theme = themes.randomElement()!
    let shuffledContent = theme.content.shuffled()
    if theme.numberOfPairs >= theme.content.count {
      theme.numberOfPairs = theme.content.count - 1
    }
    model = MemoryGame<String>(numbersOfPairsOfCards: theme.numberOfPairs) { pairIndex in shuffledContent[pairIndex] }
  }
}
