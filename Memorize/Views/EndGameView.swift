//
//  EndGameView.swift
//  Memorize
//
//  Created by Eric Cartman on 24.11.2022.
//

import SwiftUI

struct EndGameView: View {
    @StateObject var game = EmojiMemoryGame()
    var body: some View {
        NavigationView {
            VStack {
                Text("Good game!")
                    .font(.title)
                    .fontWeight(.black)
                    .padding([.bottom, .trailing], 20)
                Image("horns")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 300, height: 300)
                NavigationLink(destination: GameView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.blue)
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Restart")
                                .fontWeight(.black)
                        }
                        .foregroundColor(.white)
                        }
                    .buttonStyle(.bordered)
                }
            }
            .padding(.bottom, 50)
        }
    }
}


struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
