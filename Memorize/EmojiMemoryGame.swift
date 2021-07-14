//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/20/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
  
  private static let smileys = ["🤓", "😉", "😂", "😛", "🥳", "😃", "😀", "😄", "😆", "😅", "🤣", "🤕", "🥲", "☺️", "😇", "🙃", "😌", "😍", "😘", "🧐", "🤪", "😜", "🥸", "😡"]
  private static let vehicleEmojis = ["🚗", "🚙", "🏎", "🚕", "🚌", "🚎", "🚓", "🚑", "🚐", "🛻", "🚘", "🏍", "🚍", "🛴", "🛵", "🚛", "🚁", "✈️", "🚡", "🛺", "🚀", "🛶", "🛸", "🚢"]
  private static let flagEmojis = ["🇦🇺", "🇦🇫", "🇧🇩", "🇨🇦", "🇨🇮", "🇮🇳", "🇺🇸", "🏁", "🇦🇹", "🇧🇴", "🇪🇬", "🇯🇵", "🏴‍☠️", "🇩🇪", "🇮🇹", "🇮🇩", "🇬🇧", "🇳🇴"]
  private static let activityEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏑", "🏏"]
  private static let foodEmojis = ["🍔", "🌭", "🌮", "🌯", "🥙", "🍕", "🍟", "🍖", "🍗", "🍱", "🍜", "🍿", "🍰", "🧁", "🍪"]
  private static let beveragesEmojis = ["🍺", "🍷", "🍸", "🍹", "🥂", "🍾", "🥃", "🍶", "☕️", "🍵", "🧉", "🥤", "🥛", "🧃", "🧋"]
  
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
