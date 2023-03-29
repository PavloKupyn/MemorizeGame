//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eric Cartman on 16.03.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject
{
    typealias Card = MemoryGame<String>.Card
    
   private static var themes: [Theme] =
    [
        Theme(themeName: "vehicles", emojisArray: ["🚂","🚘","🚔","🚅","🛴","🏍","🚝","🚠","🚟","🚃","🚋","🚞"], numberOfPairsOfCards: 7, color: "blue"),
        Theme(themeName: "animals", emojisArray: ["🐶","🐱","🦊","🐻","🐼","🐨","🦁","🐵"], numberOfPairsOfCards: 8, color: "purple"),
        Theme(themeName: "people", emojisArray: ["👮‍♀️","👷‍♀️","💂‍♀️","🕵️‍♀️","👩‍⚕️","👩‍🍳","👩‍🏫"], numberOfPairsOfCards: 7, color: "green"),
        Theme(themeName: "flags", emojisArray: ["🏳️‍🌈","🇦🇹","🇦🇿","🇦🇱","🇧🇪","🇧🇦","🇺🇦","🇨🇴"], numberOfPairsOfCards: 8, color: "red"),
        Theme(themeName: "food", emojisArray: ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍒"], numberOfPairsOfCards: 9, color: "brown"),
        Theme(themeName: "sports", emojisArray: ["⚽️","🏀","🏈","⚾️","🎾","🏐"], numberOfPairsOfCards: 56, color: "orange")
    ]
    
   private static func createMemoryGame(theme: Theme) -> MemoryGame<String>
    {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards)
            { pairIndex in
              theme.emojisArray[pairIndex]
            }
    }
    
   @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    func getThemeName() -> String
    {
        theme.themeName
    }
    
    var themeColor: Color
    {
        switch theme.color
        {
        case "blue":
            return .blue
        case "purple":
            return .purple
        case "green":
            return .green
        case "red":
            return .red
        case "orange":
            return .orange
        case "brown":
            return .brown
        default:
            return .black
        }
    }
    
    var score: Int
    {
        return model.score
    }
    
    var cards: [Card]
    {
        model.cards
    }
    
    init()
    {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojisArray.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card)
    {
        model.choose(card)
    }
}
