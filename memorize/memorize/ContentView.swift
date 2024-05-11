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
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }.foregroundColor(.indigo).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView : View {
   @State var isFaceUp = false
    
    var body: some View{
        ZStack {
            let base = Circle()
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else{
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
            print("clickou")
        }
    }
}
