//
//  ContentView.swift
//  memorize
//
//  Created by giovanni on 10/05/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","💘","🌍","🛰"]
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.indigo).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView : View {
    let content: String
   @State var isFaceUp = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else{
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
            print("clickou")
        }
    }
}
