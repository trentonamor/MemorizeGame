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
//    func cardThemePicker(with theme: [String], cardColor: Color, title: String, symbol: String) -> some View {
//        Button(action: {
//            let numberOfPairs = Int.random(in: 4...10)
//            self.emojis = self.createSuffledPairedArray(with: theme, numberOfPairs: numberOfPairs)
//            self.cardColor = cardColor
//        }, label: {
//            VStack {
//                Image(systemName: symbol)
//                    .font(.title)
//                Text(title)
//                    .font(.subheadline)
//            }
//        })
//        .disabled(Set(theme).isSubset(of: Set(self.emojis)))
//    }
    
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