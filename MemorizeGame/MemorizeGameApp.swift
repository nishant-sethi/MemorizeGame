//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by Nishant sethi on 17/12/2023.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
