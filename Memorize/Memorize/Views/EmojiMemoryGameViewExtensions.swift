//
//  ContentViewExtensions.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/31/24.
//

import Foundation
import SwiftUI

extension EmojiMemoryGameView {
    // Helper Functions
    
    func createSuffledPairedArray(with theme: [String], numberOfPairs: Int) -> [String] {
        var result: [String] = []
        for emoji in theme {
            for _ in 0..<numberOfPairs {
                result.append(emoji)
            }
        }
        return result.shuffled()
    }
}
