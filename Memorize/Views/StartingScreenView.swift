//
//  StartingScreenView.swift
//  Memorize
//
//  Created by Eric Cartman on 24.11.2022.
//

import SwiftUI

struct StartingScreenView: View {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Memorize⚡️")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
                Image("istockphoto-636079026-612x612")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 300, height: 300)
                NavigationLink(destination: GameView(game: game)) {
                    playButton
                        .padding(.top, 10)
                }
                .padding(.bottom, 20)
                Text("Find mathches!")
                    .fontWeight(.bold)
            }
            .padding(.bottom, 100)
        }
    }
    
    var playButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 140, height: 50)
                .foregroundColor(.blue)
            HStack {
                Text("Play")
                    .fontWeight(.black)
                Image(systemName: "chevron.right.square.fill")
            }
            .foregroundColor(.white)
            }
        .buttonStyle(.bordered)
    }
}

struct StartingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartingScreenView()
    }
}
