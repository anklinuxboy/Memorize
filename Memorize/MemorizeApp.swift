//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ankit Sharma on 6/9/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
  
  let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
          ContentView(viewModel: game)
        }
    }
}
