//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by giovanni on 13/05/24.
//

import SwiftUI

class ViewModelEmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻","💘","🌍","🛰","💟","🔐","🪬","💎","🚀","✈️"]
        
    private static func createMemoryGame() -> ModelMemoryGame<String> {
        return ModelMemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "!!"
            }
        }
    }
        
        @Published private var model =  createMemoryGame()
        
        var cards: Array<ModelMemoryGame<String>.Card>  {
            return model.cards
        }
    
    func shuffle(){
        model.shuffle()
    }
        
        func choose(_ card: ModelMemoryGame<String>.Card) {
            return model.choose(card)
        }
}
