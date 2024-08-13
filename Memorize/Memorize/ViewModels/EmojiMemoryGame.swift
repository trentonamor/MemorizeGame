//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/1/24.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var model: MemoryGame<String>
    var backOfCardColor: Color
    private(set) var themeName: String
    
    var cards: [Card] {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    init() {
        let theme = EmojiMemoryGame.randomTheme()
        self.themeName = theme.name
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
        self.backOfCardColor = EmojiMemoryGame.getColor(theme.color)
        self.model.shuffle()
    }
    
    // MARK: Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    // MARK: Helpers
    
    func createNewGame() {
        let theme = EmojiMemoryGame.randomTheme()
        self.themeName = theme.name
        self.model = Self.createMemoryGame(theme: theme)
        self.backOfCardColor = Self.getColor(theme.color)
        self.shuffle()
    }
    
    private static func createMemoryGame(theme: MemoryGame<String>.Theme) -> MemoryGame<String> {
        var emojiSet = theme.emojis.shuffled()
        emojiSet = Array(emojiSet.prefix(theme.numberOfPairs))
        return MemoryGame<String>(numberOfCardPairs: theme.numberOfPairs) { pairIndex in
            emojiSet[pairIndex]
        }
    }
    
    private static func randomTheme() -> MemoryGame<String>.Theme {
        return ThemeProvider.themes.randomElement() ?? ThemeProvider.themes[0]
    }
    
    private static func getColor(_ color: String) -> Color {
        switch color.lowercased() {
            case "red":
                return .dynamicRed
            case "pink":
                return .dynamicPink
            case "orange":
                return .dynamicOrange
            case "yellow":
                return .dynamicYellow
            case "green":
                return .dynamicGreen
            case "lime":
                return .dynamicLime
            case "blue":
                return .dynamicBlue
            case "navy":
                return .dynamicNavy
            case "cyan":
                return .dynamicCyanBlue
            case "teal":
                return .dynamicGreenBlue
            case "turquoise":
                return .dynamicGreenCyan
            case "purple":
                return .dynamicPurple
            default:
                return .dynamicGrey100
        }

    }
}
