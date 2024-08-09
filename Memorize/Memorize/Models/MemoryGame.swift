import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var faceUpCardIndex: Int? {
        get {
            self.cards.indices.filter { index in self.cards[index].isFaceUp }.only
        }
        set {
            // Reset all cards to face down unless it's the card at the new faceUpCardIndex
            self.cards.indices.forEach { index in
                let wasFaceUp = self.cards[index].isFaceUp
                self.cards[index].isFaceUp = (newValue == index)
                
                if wasFaceUp && !self.cards[index].isFaceUp {
                    // Mark the card as seen
                    self.seenCards.insert(self.cards[index].id)
                }
            }
        }
    }
    
    private var seenCards: Set<String> = []
    private(set) var score = 0
    
    init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = []
        for i in 0..<numberOfCardPairs {
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: "\(i+1)a"))
            cards.append(Card(content: content, id: "\(i+1)b"))
        }
        self.shuffle()
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
            faceUpCardIndex = chosenIndex
        }
    }
    
    private mutating func handleMatchCheck(chosenIndex: Int, potentialMatchIndex: Int) {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
            // If the cards match
            cards[chosenIndex].isMatched = true
            cards[potentialMatchIndex].isMatched = true
            score += 2
        } else {
            // If the cards don't match
            if seenCards.contains(cards[chosenIndex].id) {
                score -= 1
            }
            if seenCards.contains(cards[potentialMatchIndex].id) {
                score -= 1
            }
        }
        // Reveal the chosen card regardless of match
        cards[chosenIndex].isFaceUp = true
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
