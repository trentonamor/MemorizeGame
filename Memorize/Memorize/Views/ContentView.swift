//
//  ContentView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = []
    
    let halloweenEmoji = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    let foodEmoji = ["🍎", "🍌", "🫐", "🥐", "🥓", "🧇", "🥨", "🌮", "🍑", "🍆", "🍔", "🍟"]
    let fishEmoji = ["🐙", "🦑", "🪼", "🦐", "🦞", "🦀", "🐡", "🐠", "🐬", "🐳", "🦈", "🐋"]
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.largeTitle)
                .foregroundStyle(.dynamicGrey80)
            ScrollView {
                cards
            }
            cardThemeAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(cardContent: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(Color.dynamicOrange)
    }
    
    var cardThemeAdjusters: some View {
        HStack {
            halloweenPicker
            Spacer()
            fishPicker
            Spacer()
            foodPicker
        }
    }
    
    var halloweenPicker: some View {
        self.cardThemePicker(with: self.halloweenEmoji, numberOfPairs: 4, title: "Halloween", symbol: "moon.circle")
    }
    
    var fishPicker: some View {
        self.cardThemePicker(with: self.fishEmoji, numberOfPairs: 5, title: "Fish", symbol: "fish.circle")
    }
    
    var foodPicker: some View {
        self.cardThemePicker(with: self.foodEmoji, numberOfPairs: 6, title: "Food", symbol: "fork.knife.circle")
    }
}

#Preview {
    ContentView()
}
