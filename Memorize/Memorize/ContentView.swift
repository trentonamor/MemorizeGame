//
//  ContentView.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["👻", "🎃", "🕷️", "😈"]

        HStack {
            ForEach(emojis, id: \.self) { emoji in
                CardView(cardContent: emoji)
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    
    @State var isFaceUp = true
    let cardContent: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(cardContent)
                    .font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
