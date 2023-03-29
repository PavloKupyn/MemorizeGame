//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Eric Cartman on 13.03.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @StateObject var game = EmojiMemoryGame()
    
    var body: some View {
        NavigationView {
            if game.cards.filter({ !$0.isFaceUp && $0.isMatched }).count == game.cards.count - 2 && game.cards.allSatisfy{$0.isMatched } && game.cards.filter {$0.isFaceUp}.count == 2 {
                EndGameView()
            }
            else {
                StartingScreenView(game: game)
            }
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
