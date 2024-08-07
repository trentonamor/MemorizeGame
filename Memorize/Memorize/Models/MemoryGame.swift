//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Trenton Parrotte on 8/1/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private var faceUpCardIndex: Int? {
        get { self.cards.indices.filter { index in self.cards[index].isFaceUp }.only
        }
        set { self.cards.indices.forEach { self.cards[$0].isFaceUp = (newValue == $0) }
        }
    }
    
    init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = []
        // Add numberOfCardPairs x 2
        for i in 0..<max(2,numberOfCardPairs) {
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: "\(i+1)a"))
            cards.append(Card(content: content, id: "\(i+1)b"))
        }
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else { return }

        if let potentialMatchIndex = faceUpCardIndex {
            handleMatchCheck(chosenIndex: chosenIndex, potentialMatchIndex: potentialMatchIndex)
        } else {
            handleNoPreviousMatch(chosenIndex: chosenIndex)
        }
        cards[chosenIndex].isFaceUp = true
    }
    
    private mutating func handleMatchCheck(chosenIndex: Int, potentialMatchIndex: Int) {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
            cards[chosenIndex].isMatched = true
            cards[potentialMatchIndex].isMatched = true
        }
        cards[chosenIndex].isFaceUp = true
    }
    
    private mutating func handleNoPreviousMatch(chosenIndex: Int) {
        faceUpCardIndex = chosenIndex
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
