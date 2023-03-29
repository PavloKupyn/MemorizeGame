//
//  Themes.swift
//  Memorize
//
//  Created by Eric Cartman on 22.03.2022.
//

import Foundation
struct Theme
{
    var themeName:String
    var emojisArray: [String]
    var numberOfPairsOfCards: Int
    var color: String
    
    init(themeName: String, emojisArray: [String], numberOfPairsOfCards: Int, color: String)
    {
        self.themeName = themeName
        self.emojisArray = emojisArray
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.color = color
        
        if numberOfPairsOfCards > emojisArray.count
        {
            self.numberOfPairsOfCards = emojisArray.count
        }
    }
} 
