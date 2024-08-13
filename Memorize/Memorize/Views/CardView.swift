//
//  CardView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/31/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.backgroundElevated)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Pie(endAngle: .radians((4 * .pi)/3))
                    .opacity(Constants.Pie.opacity)
                    .overlay {
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(Constants.Pie.inset)
                    }
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(self.card.isFaceUp || !self.card.isMatched ? 1: 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 8
        
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 8
        }
    }
}

#Preview {
    typealias Card = CardView.Card
    
    return VStack {
        HStack {
            CardView(Card(content: "X", id: "1a"))
            CardView(Card(isFaceUp: true, content: "X", id: "1b"))
        }
        HStack {
            CardView(Card(isFaceUp: true, isMatched: true, content: "This is a very long string that is super long", id: "2a"))
            CardView(Card(isMatched: true, content: "X", id: "2b"))
        }
    }
    .padding()
    .foregroundStyle(.dynamicGreen)
}
