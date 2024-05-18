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
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Path{
                    p in
                    p.move(to: .zero)
                    p.addLine(to: CGPoint(x: 100, y: 100))
                }.stroke(lineWidth: 6)
                Pie(endAngle: .degrees(240))
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .aspectRatio(1, contentMode: ContentMode.fit)
                            .multilineTextAlignment(.center)
                            .padding(Constants.Pie.insent)
                        ).padding(Constants.insent)
                }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
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
