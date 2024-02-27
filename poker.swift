// Масти карт
enum Suit: String, CaseIterable {
    case spade = "♤", heart = "♡", club = "♧", diamond = "♢"
}
// Достоинства карт
enum Rank: Int, CaseIterable {
    case _2 = 2, _3, _4, _5, _6, _7, _8, _9, _10, _J, _Q, _K, _A
}
// Класс Карты
class Card {
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank){
        self.suit=suit
        self.rank=rank
    }
    
    // Приведение класса карты к строке
    func getDescription() -> String {
        return "\(suit.rawValue)\(rank)"
    }
}

// Класс Колоды
class Deck {
    var cards: [Card]
    
    init() {
        cards = [Card]()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        cards.shuffle()
    }

    // Раздача
    func deal() -> [Card] {
        var result = [Card]()
        for _ in 1...5{
            result.append(cards.removeFirst())
        }
        return result
    }
}

// Класс комбинации
class Draw: CustomStringConvertible {
    var cards: [Card]

    init(cards: [Card]) {
        self.cards=cards
    }
    
    // Определение коминации
    func rank() -> String {
        let flush = cards.allSatisfy({$0.suit == cards[0].suit})
        let straight = cards.enumerated().allSatisfy({$0 == 4 || $1.rank.rawValue == cards[$0 + 1].rank.rawValue + 1})
        
        if flush && straight {
            if cards[0].rank == ._A && cards[4].rank == ._10 {
                return "Royal flush"
            } else {
                return "Straight flush"
            }
        }
        
        if let quad = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 4}) {
            return "Quads \(quad.rank)"
        }
        
        if let triple = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 3}),
            let pair = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2 && card.rank != triple.rank}) {
            return "Full House \(triple.rank) and \(pair.rank)"
        }
        
        if flush {
            return "Flush \(cards.first!.suit)"
        }
        
        if straight {
            return "Straight to \(cards.first!.rank)"
        }
        
        if let triple = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 3}) {
            return "Set \(triple.rank)"
        }
        
        if let pair1 = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2}),
           let pair2 = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2 && card.rank != pair1.rank}) {
           
           
           return "Two pairs \(pair1.rank) and \(pair2.rank)"
        }
        
        if let pair = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2}) {
            return "Pair \(pair.rank)"
        }
        
        return "No combination, high card \(cards[0].rank)"
    }
    
    // Приведение комбинации в раздаче к строке
    public var description: String {
        cards.sort(by: {$0.rank.rawValue > $1.rank.rawValue})
        return "\(cards.map({$0.getDescription()}).joined(separator: " | ")) - \(rank())"
    }
}


var draws: [Draw] = []

for _ in 1...5 {
    let deck = Deck()
    let draw = Draw(cards: deck.deal())
    draws.append(draw)
}

for draw in draws {
    print(draw)
}