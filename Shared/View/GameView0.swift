//
//  GameView.swift
//  HexGridDemo
//
//  Created by Rudolf Farkas on 30.11.21.
//

import SwiftUI

struct GameView0: View {
    @ObservedObject var viewModel = GameViewModel()
    var body: some View {
        ZStack {
            Color(red: 0.78, green: 0.44, blue: 0.20).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Counters")
                Spacer()
                Text("Game Board View")
                Spacer()
                Text("Buttons")
            }
        }
    }
}

struct GameView0_Previews: PreviewProvider {
    static var previews: some View {
        GameView0()
    }
}
