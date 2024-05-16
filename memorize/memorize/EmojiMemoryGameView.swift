//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by giovanni on 10/05/24.
//

import SwiftUI
 
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:  ViewModelEmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Embaralhar"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards) {card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }.foregroundColor(.indigo)
    }
}
    
    struct CardView : View {
        let card: ModelMemoryGame<String>.Card
        
        init(_ card: ModelMemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View{
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.content).font(.system(size: 100))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: ContentMode.fit)
                }.opacity(card.isFaceUp ? 1 : 0)
                base.fill().opacity(card.isFaceUp ? 0 : 1)
            }
        }
    }
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            EmojiMemoryGameView(viewModel: ViewModelEmojiMemoryGame())
        }
}
