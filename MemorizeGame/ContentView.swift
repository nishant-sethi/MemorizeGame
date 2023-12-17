//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Nishant sethi on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(isFaceUp ? .white : .orange)
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            }
        }
    }
}
#Preview {
    ContentView()
}
