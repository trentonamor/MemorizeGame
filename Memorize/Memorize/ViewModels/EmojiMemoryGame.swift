//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/1/24.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @Published private var model: MemoryGame<String> = MemoryGame(numberOfCardPairs: 15) { index in
        guard emojis.indices.contains(index) else {
            return "Invalid"
        }
        return emojis[index]
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
