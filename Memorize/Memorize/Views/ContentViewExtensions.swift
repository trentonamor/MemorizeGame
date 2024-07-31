//
//  ContentViewExtensions.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/31/24.
//

import Foundation
import SwiftUI

extension ContentView {
    // Helper Functions
    func cardThemePicker(with theme: [String], numberOfPairs: Int, title: String, symbol: String) -> some View {
            Button(action: {
                self.emojis = self.createSuffledPairedArray(with: theme, numberOfPairs: numberOfPairs)
            }, label: {
                VStack {
                    Image(systemName: symbol)
                        .font(.title)
                    Text(title)
                        .font(.subheadline)
                }
            })
            .disabled(Set(theme).isSubset(of: Set(self.emojis)))
    }
    
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
