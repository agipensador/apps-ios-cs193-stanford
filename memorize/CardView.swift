//
//  CardView.swift
//  memorize
//
//  Created by giovanni on 17/05/24.
//

import SwiftUI

struct CardView : View {
    typealias Card = ModelMemoryGame<String>.Card
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View{
        Pie(endAngle: .degrees(240))
            .opacity( Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size:Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: ContentMode.fit)
                    .padding(Constants.Pie.insent)
                ).padding(Constants.insent)
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let insent: CGFloat = 5
        struct FontSize{
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest/largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let insent: CGFloat = 5

        }
    }   
}

struct CardView_Previews: PreviewProvider {
    typealias Card = ModelMemoryGame<String>.Card

    static var previews: some View {
        CardView(Card(content: "x", id: "teste1"))
            .padding().foregroundColor(.pink )
    }
}
