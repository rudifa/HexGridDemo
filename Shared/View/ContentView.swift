//
//  ContentView.swift
//  Shared
//
//  Created by Rudolf Farkas on 26.11.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = GameViewModel()
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: { HexRingsBoardsView() }, label: { Text("Hex Rings Boards View") })

                NavigationLink(destination: { HexSpiralBoardsView() }, label: { Text("Hex Spiral Boards View") })

                NavigationLink(destination: { HexRingBoardView2() }, label: { Text("Hex Ring Board View 2") })

                NavigationLink(destination: { HexRingBoardView3() }, label: { Text("Hex Ring Board View 3") })

                NavigationLink(destination: { GameView(viewModel: viewModel) }, label: { Text("Game View") })
            }
            .navigationTitle(Text("Demos"))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
