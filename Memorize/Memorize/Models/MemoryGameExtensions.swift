//
//  MemoryGameExtensions.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/8/24.
//

import Foundation

extension MemoryGame {
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "Up" : "Down") \(isMatched ? "Matched" : "")"
        }
    }
}
