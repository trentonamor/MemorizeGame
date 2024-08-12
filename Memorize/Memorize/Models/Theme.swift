//
//  Theme.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/8/24.
//

import Foundation

struct ThemeProvider {
    // To add a theme, create a new theme in the themes array
    static let themes: [MemoryGame<String>.Theme] = [
        MemoryGame<String>.Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"], color: "orange", numberOfPairs: 5),
        MemoryGame<String>.Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐢"], color: "red", numberOfPairs: 6),
        MemoryGame<String>.Theme(name: "Fruits", emojis: ["🍎", "🍌", "🍇", "🍉", "🍓", "🍒", "🍑", "🍍", "🥝", "🍋", "🍊", "🫐"], color: "green", numberOfPairs: 7),
        MemoryGame<String>.Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥏", "🏏"], color: "blue", numberOfPairs: Int.min),
        MemoryGame<String>.Theme(name: "Faces", emojis: ["😀", "😂", "😍", "😎", "🥳", "😡", "😭", "😴", "🤓", "😱", "🥸", "😤"], color: "yellow", numberOfPairs: Int.max),
        MemoryGame<String>.Theme(name: "Flags", emojis: ["🇺🇸", "🇬🇧", "🇨🇦", "🇫🇷", "🇩🇪", "🇮🇳", "🇯🇵", "🇨🇳", "🇧🇷", "🇮🇹", "🏴‍☠️", "🇦🇶"], color: "purple")
    ]
}

extension MemoryGame {
    struct Theme {
        let name: String
        let numberOfPairs: Int
        var emojis: [String]
        var color: String
        
        init(name: String, emojis: [String], color: String, numberOfPairs: Int? = nil) {
            self.name = name
            if let numberOfPairs = numberOfPairs {
                // Ensure number of pairs is between 4 and emoji array size
                self.numberOfPairs = max(min(emojis.count, numberOfPairs), 4)
            } else {
                self.numberOfPairs = Int.random(in: 4...emojis.count)
            }
            self.emojis = emojis
            self.color = color
        }
    }
}
