//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/30/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
