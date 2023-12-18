//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Nishant sethi on 17/12/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻","🎃","🕷️", "😈","💀","🕸️","🧙", "🙀","👹","😱","☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var game = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>  {
        game.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.chooseCard(card)
    }
    
    //MARK: - Intent to shuffle cards
    func shuffle() {
        game.shuffle()
    }
    
}
