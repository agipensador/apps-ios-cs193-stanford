//
//  memorizeApp.swift
//  memorize
//
//  Created by giovanni on 10/05/24.
//

import SwiftUI

@main
struct UIMemorizeApp: App {
    @StateObject var game = ViewModelEmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
