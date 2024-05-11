//
//  ContentView.swift
//  memorize
//
//  Created by giovanni on 10/05/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }.foregroundColor(.indigo).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView : View {
    var isFaceUp: Bool = false
    var body: some View{
        ZStack (content: {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else{
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}
