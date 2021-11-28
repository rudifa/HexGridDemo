//
//  HexBoards2View.swift
//  HexGridDemo (iOS)
//
//  Created by Rudolf Farkas on 28.11.21.
//

import HexGrid
import rfSwiftUI
import SwiftUI

struct HexagonView: View {
    var body: some View {
        Hexagon()
    }
}

struct HexRingBoardView: View {

    let radius = 1
    var hexes: [Hex] {
        hexRing(center: Hex(q: 0, r: 0, s: 0), radius: radius)
    }

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let hexSize = size / CGFloat(radius * 6)
            let layout = Layout(orientation: Layout.flat,
                                size: Point(x: hexSize, y: hexSize),
                                origin: Point(x: geometry.size.width / 2, y: geometry.size.height / 2))
            let points = hexes.map { Point2(point: layout.hexToPixel(h: $0)) }
            ZStack {
                ForEach(points) { point in
                    Hexagon()
                        .stroke()
                        .frame(width: hexSize*2, height: hexSize*2, alignment: .center)
                        .offset(x: point.x, y: point.y)
                }
            }
        }
    }
}

struct HexBoards2View: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HexBoards2View_Previews: PreviewProvider {
    static var previews: some View {
        HexRingBoardView()
        // HexagonView()
    }
}
