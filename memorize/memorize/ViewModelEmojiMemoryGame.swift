//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by giovanni on 13/05/24.
//

import SwiftUI

class ViewModelEmojiMemoryGame: ObservableObject {
    
    typealias Card = ModelMemoryGame<String>.Card
    
    private static let emojis = ["👻","💘","🌍","🛰","💟","🔐","🪬","💎","🚀","✈️"]
        
    private static func createMemoryGame() -> ModelMemoryGame<String> {
        return ModelMemoryGame(numberOfPairsOfCards: 1) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "!!"
            }
        }
    }
        
    @Published private var model =  createMemoryGame()
    
    var cards: Array<Card>  {
        model.cards
    }
    
    var color: Color {
        .indigo
    }

    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card:  Card) {
        model.choose(card)
    }
}
