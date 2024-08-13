//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/30/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let cardAspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            navBar
            cards
                .foregroundStyle(self.viewModel.backOfCardColor)
                .animation(.default, value: viewModel.cards)
        }
        .padding()
    }
    
    private var navBar: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Memorize")
                    .foregroundStyle(.dynamicGrey80)
                Text(self.viewModel.themeName)
                    .font(.title3)
                    .foregroundStyle(.dynamicGrey40)
            }
            Spacer()
            Text("\(self.viewModel.score)")
                .font(.largeTitle)
                .foregroundStyle(.dynamicGrey80)
            Spacer()
            Button(action: {
                self.viewModel.createNewGame()
            }, label: {
                Text("New Game")
            })
        }
        .font(.title2)
    }
    
    private var cards: some View {
        AspectVGrid(self.viewModel.cards, aspectRatio: self.cardAspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
