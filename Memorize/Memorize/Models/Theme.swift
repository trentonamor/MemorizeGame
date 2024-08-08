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
        MemoryGame<String>.Theme(name: "Halloween", numberOfPairs: 5, emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"], color: "orange"),
        MemoryGame<String>.Theme(name: "Animals", numberOfPairs: 6, emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐢"], color: "red"),
        MemoryGame<String>.Theme(name: "Fruits", numberOfPairs: 7, emojis: ["🍎", "🍌", "🍇", "🍉", "🍓", "🍒", "🍑", "🍍", "🥝", "🍋", "🍊", "🫐"], color: "green"),
        MemoryGame<String>.Theme(name: "Sports", numberOfPairs: 8, emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥏", "🏏"], color: "blue"),
        MemoryGame<String>.Theme(name: "Faces", numberOfPairs: 9, emojis: ["😀", "😂", "😍", "😎", "🥳", "😡", "😭", "😴", "🤓", "😱", "🥸", "😤"], color: "yellow"),
        MemoryGame<String>.Theme(name: "Flags", numberOfPairs: 10, emojis: ["🇺🇸", "🇬🇧", "🇨🇦", "🇫🇷", "🇩🇪", "🇮🇳", "🇯🇵", "🇨🇳", "🇧🇷", "🇮🇹", "🏴‍☠️", "🇦🇶"], color: "purple")
    ]
}

extension MemoryGame {
    struct Theme {
        let name: String
        let numberOfPairs: Int
        var emojis: [String]
        var color: String
        
        init(name: String, numberOfPairs: Int, emojis: [String], color: String) {
            self.name = name
            self.numberOfPairs = max(min(emojis.count, numberOfPairs), 4) // Ensure number of pairs is between 4 and emoji array size
            self.emojis = emojis
            self.color = color
        }
    }
}
