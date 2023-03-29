//
//  CardView.swift
//  Memorize
//
//  Created by Eric Cartman on 13.03.2022.
//

import SwiftUI

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        
            ZStack {
                let shape =  RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp
                {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        .padding(DrawingConstants.circlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                    Text(card.content)
                        .font(.largeTitle)
                }
                else if card.isMatched
                {
                    shape.opacity(0)
                }
                else
                {
                    shape.fill()
                }
            }
        
    }
    
    private func font(in size: CGSize) -> Font
    {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants
    {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.70
        static let circlePadding : CGFloat = 5
        static let circleOpacity: CGFloat = 0.5
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView( card: MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "👺", id: 4))
    }
}
