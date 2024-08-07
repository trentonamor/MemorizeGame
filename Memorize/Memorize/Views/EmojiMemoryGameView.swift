//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/30/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    let halloweenEmoji = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
//    let foodEmoji = ["🍎", "🍌", "🫐", "🥐", "🥓", "🧇", "🥨", "🌮", "🍑", "🍆", "🍔", "🍟"]
//    let fishEmoji = ["🐙", "🦑", "🪼", "🦐", "🦞", "🦀", "🐡", "🐠", "🐬", "🐳", "🦈", "🐋"]
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.largeTitle)
                .foregroundStyle(.dynamicGrey80)
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
//            cardThemeAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundStyle(.dynamicOrange)
    }
    
//    var cardThemeAdjusters: some View {
//        HStack {
//            halloweenPicker
//            Spacer()
//            fishPicker
//            Spacer()
//            foodPicker
//        }
//    }
    
//    var halloweenPicker: some View {
//        self.cardThemePicker(with: self.halloweenEmoji, cardColor: .dynamicOrange, title: "Halloween", symbol: "moon.circle")
//    }
//    
//    var fishPicker: some View {
//        self.cardThemePicker(with: self.fishEmoji, cardColor: .dynamicCyanBlue, title: "Fish", symbol: "fish.circle")
//    }
//    
//    var foodPicker: some View {
//        self.cardThemePicker(with: self.foodEmoji, cardColor: .dynamicLime, title: "Food", symbol: "fork.knife.circle")
//    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
