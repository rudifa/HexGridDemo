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

struct Point2: Identifiable {
    let id = UUID()
    let x: CGFloat
    let y: CGFloat
    init(point: Point) {
        x = point.x
        y = point.y
    }
}

struct Point3: Identifiable {
    let id = UUID()
    let point: Point
    var x: CGFloat{ point.x}
    var y: CGFloat{ point.x}
 }

struct Hex2: Identifiable {
    let id = UUID()

    let q: CGFloat
    let r: CGFloat
    let s: CGFloat
    init(hex: Hex) {
        q = hex.q
        r = hex.r
        s = hex.s
    }

    var hex: Hex {
        Hex(q: q, r: r, s: s)
    }
}

let layout = Layout(orientation: Layout.flat,
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

public struct Polygon2: Shape {
    let layout: Layout
    let hex: Hex
    var corners: [CGPoint] {
        layout.polygonCorners(h: hex)
            .map { $0.cgPoint }
    }

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

struct HexRingsBoardView: View {
    var hexes2: [Hex2]
    var body: some View {
        ZStack {
            ForEach(hexes2) { hex2 in
                Polygon2(layout: layout, hex: hex2.hex)
                    .stroke(.green)
//                    .foregroundColor(Color.blue)
//                    //.offset(x: offset.x, y: offset.y)
            }
        }
    }
}

struct HexRingsBoardsView: View {
    var body: some View {
        VStack {
            Text("Hello, Hex World!")
            // Polygon(corners: centerHexCorners).stroke(.red)
//            Polygon2(layout: layout, hex: Hex(q: 2, r: 2, s: -4)).stroke(.blue)

//            Polygon2(layout: layout, hex: Hex(q: 0, r: 0, s: 0)).stroke(.blue)
            ZStack {
                HexRingsBoardView(hexes2: hexRing(center: Hex(q: 0, r: 0, s: 0), radius: 1)
                    .map { Hex2(hex: $0) })
                HexRingsBoardView(hexes2: hexRing(center: Hex(q: 0, r: 0, s: 0), radius: 3)
                    .map { Hex2(hex: $0) })
            }
        }
    }
}

struct HexSpiralBoardsView: View {
    var body: some View {
        VStack {
            Text("Hello, Hex World!")
            ZStack {
                HexRingsBoardView(hexes2: hexSpiral(radius: 3)
                    .map { Hex2(hex: $0) })
            }
        }
    }
}

struct HexBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HexRingsBoardsView()
    }
}
