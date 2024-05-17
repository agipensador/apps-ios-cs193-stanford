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
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
//            if faceUpCardItems.count == 1 {
//                return faceUpCardItems.first
//            } else {
//                return nil
//            }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
    }
    
    mutating func choose(_ card: Card){
        if let chooseIndex = cards.firstIndex(where:{ $0.id == card.id}){
            if !cards[chooseIndex].isFaceUp && !cards[chooseIndex].isMatched{
                if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chooseIndex].content == cards[potentialMatchedIndex].content {
                        cards[chooseIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chooseIndex
                }
                cards[chooseIndex].isFaceUp = true
                
            }
        }
      }
        
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
        
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id) \(content) \(isFaceUp ? "cima" : "baixo")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
