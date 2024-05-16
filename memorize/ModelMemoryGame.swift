//
//  MemorizeGame.swift
//  memorize
//
//  Created by giovanni on 13/05/24.
//

import Foundation

struct ModelMemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards)  {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card){
    
        let chooseIndex = index(of: card)
        cards[chooseIndex].isFaceUp.toggle()
      }
    
    func index(of card: Card) -> Int{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0 // FIXME: Bogus!
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id) \(content) \(isFaceUp ? "cima" : "baixo")"
        }
    }
}
