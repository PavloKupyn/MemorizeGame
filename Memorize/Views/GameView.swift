//
//  GameView.swift
//  Memorize
//
//  Created by Eric Cartman on 24.11.2022.
//

import SwiftUI

struct GameView: View {
    @StateObject var game = EmojiMemoryGame()

    var body: some View {
        gameView
    }
    
    var gameView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(game.cards) { card in
                    cardView(for: card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        .padding(.horizontal)
        .foregroundColor(game.themeColor)
            scoreButton
                .padding(.top, 20)
        }
    }
    
    var scoreButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 150, height: 50)
                .foregroundColor(.blue)
           
            Text("Score: \(game.score)")
                .fontWeight(.black)
                .foregroundColor(.white)
            }
        .buttonStyle(.bordered)
    }
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View
    {
        if card.isMatched && !card.isFaceUp
        {
            Rectangle().opacity(0)
        }
        else
        {
            CardView(card: card)
            .padding(4)
            .onTapGesture
            {
                game.choose(card)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
           
    }
}
