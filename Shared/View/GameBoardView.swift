//
//  GameBoardView.swift
//  HexGridDemo
//
//  Created by Rudolf Farkas on 30.11.21.
//

import SwiftUI

// see Set - AspectVGrid

struct GameBoardView<Item, ItemView>: View where ItemView: View, Item: Identifiable, Item: Hashable {
    var items: [Item]
    var content: (Item) -> ItemView

    init(items: [Item], @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.content = content
    }

    var body: some View {
        GeometryReader { _ in
            ZStack {
                Text("Game Board View items \(items.count)")

                // using directly the key operation: zip together indices and data items
                // ForEach requires Item to be Hashable
                // This pattern does not require Item to be Identifiable
                ForEach(Array(zip(items.indices, items)), id: \.1) { index, item in
                    content(item)
                        .position(x: 150, y: CGFloat(50 * index))
                }
            }
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView(items: items(n: 10)) { item in
            ItemView(item: item)
        }
    }
}
