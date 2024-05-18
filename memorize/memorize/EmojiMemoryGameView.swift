//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by giovanni on 10/05/24.
//

import SwiftUI
 
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:  ViewModelEmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
                .animation(.default, value: viewModel.cards)
        Button("Embaralhar"){
            viewModel.shuffle()
        }
    }
        .padding()
    }
    
    private var cards: some View{
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) {card in
                CardView(card)
                    .padding(spacing)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
        }
    }
}
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            EmojiMemoryGameView(viewModel: ViewModelEmojiMemoryGame())
        }
}
