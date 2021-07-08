//
//  GameThemes.swift
//  Memorize
//
//  Created by Ankit Sharma on 7/7/21.
//

import SwiftUI

struct GameTheme<CardContent> {
  var name: String
  var content: [CardContent]
  var numberOfPairs: Int
  var color: Color
}
