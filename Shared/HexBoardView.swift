//
//  HexBoardViews.swift
//  HexGridDemo (iOS)
//
//  Created by Rudolf Farkas on 26.11.21.
//

import SwiftUI

import HexGrid

extension Point {
    var cgPoint: CGPoint {
        CGPoint(x: x, y: y)
    }
}

let layout = Layout(orientation: Layout.pointy,
                    size: Point(x: 20, y: 20),
                    origin: Point(x: 0, y: 0))

let centerHexCorners = layout.polygonCorners(h: Hex(q: 0, r: 0, s: 0))
    .map { $0.cgPoint }

public struct Polygon: Shape {
    let corners: [CGPoint]

    public func path(in rect: CGRect) -> Path {
        var p = Path()
        if corners.count == 0 { return p }
        let translated = corners.map { CGPoint(x: $0.x + rect.midX, y: $0.y + rect.midY) }
        p.move(to: translated[0])
        for corner in translated { p.addLine(to: corner) }
        p.closeSubpath()
        return p
    }
}

struct HexBoardView: View {
    var body: some View {
        VStack {
            Text("Hello, Hex World!")
            Polygon(corners: centerHexCorners).stroke(.red)
        }
    }
}

struct HexBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HexBoardView()
    }
}
