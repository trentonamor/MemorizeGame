//
//  CardView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/31/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.backgroundElevated)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(self.card.isFaceUp || !self.card.isMatched ? 1: 0)
    }
}

#Preview {
    CardView(MemoryGame<String>.Card(content: "👻", id: UUID()))
}
