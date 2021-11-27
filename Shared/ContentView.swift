//
//  ContentView.swift
//  Shared
//
//  Created by Rudolf Farkas on 26.11.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: { HexRingsBoardsView() }, label: { Text("Hex Rings Boards View") })

                NavigationLink(destination: { HexSpiralBoardsView() }, label: { Text("Hex Spiral Boards View") })
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
