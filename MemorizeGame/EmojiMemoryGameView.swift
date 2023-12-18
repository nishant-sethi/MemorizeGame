//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Nishant sethi on 17/12/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    let emojis: [String] = ["👻","🎃","🕷️", "😈","💀","🕸️","🧙", "🙀","👹","😱","☠️", "🍭"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.shuffled(), id:\.self) { emoji in
                CardView(content: emoji)
                    .aspectRatio(9/4, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp  ? 1 : 0)
            base.fill(.orange).opacity(isFaceUp  ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame()
}
