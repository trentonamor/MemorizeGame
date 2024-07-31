//
//  CardView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/31/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    @State var isFaceUp = false
    let cardContent: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.backgroundElevated)
                base.strokeBorder(lineWidth: 2)
                Text(cardContent)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(cardContent: "🦖")
}
