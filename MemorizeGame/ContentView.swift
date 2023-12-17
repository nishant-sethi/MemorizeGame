//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Nishant sethi on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️", "😈","💀","🕸️","🧙", "🙀","👹","😱","☠️", "🍭"]
    @State var cardCount: Int = 12
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAddAndRemover
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String, disabled: Bool) -> some View {
        Button(action :{
            cardCount += offset
        },
               label: {
            Image(systemName: symbol)
        })
        .disabled(disabled)
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardAddAndRemover: some View {
        HStack {
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill",disabled: cardCount < 1)
            Spacer()
            cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill",disabled: cardCount >= emojis.count)
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
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
    ContentView()
}
