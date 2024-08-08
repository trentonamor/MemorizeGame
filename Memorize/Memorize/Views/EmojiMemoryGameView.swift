//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/30/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            navBar
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
        }
        .padding()
    }
    
    var navBar: some View {
        HStack {
            Text("Memorize")
                .foregroundStyle(.dynamicGrey80)
            Spacer()
            Button(action: {
                // FIXME: Reset Game
                self.viewModel.createNewGame()
            }, label: {
                Text("New Game")
            })
        }
        .font(.title2)
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
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
