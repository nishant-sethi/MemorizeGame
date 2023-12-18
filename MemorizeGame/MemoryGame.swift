//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by Nishant sethi on 17/12/2023.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: Array<Card>
    
    func chooseCard(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
