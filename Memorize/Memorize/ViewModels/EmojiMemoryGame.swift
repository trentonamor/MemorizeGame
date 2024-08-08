//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/1/24.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    init() {
        self.model = Self.createMemoryGame()
        self.model.shuffle()
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func createNewGame() {
        self.model = EmojiMemoryGame.createMemoryGame()
        self.shuffle()
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let theme = ThemeProvider.themes.randomElement() ?? ThemeProvider.themes[0]
        var emojiSet = theme.emojis.shuffled()
        emojiSet = Array(emojiSet.prefix(upTo: theme.numberOfPairs))
        return MemoryGame<String>(numberOfCardPairs: theme.numberOfPairs) { pairIndex in
            emojiSet[pairIndex]
        }
    }
}

