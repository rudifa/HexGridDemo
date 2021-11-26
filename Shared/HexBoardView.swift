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

//extension Hex: Identifiable {
//    public var id: ObjectIdentifier {
//        <#code#>
//    }
//}

//extension Hex: Hashable, Identifiable {
//    public var id: ObjectIdentifier {
//        <#code#>
//    }
//
////    static func == (lhs: Hex, rhs: Hex) -> Bool {
////      return lhs.q == rhs.q &&
////      lhs.r == rhs.r &&
////      lhs.s == rhs.s
////    }
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(q)
//        hasher.combine(r)
//        hasher.combine(r)
//    }
//}

struct Hex2:  Identifiable {
    let id = UUID()

    let q: CGFloat
    let r: CGFloat
    let s: CGFloat
    init(hex: Hex) {
        self.q = hex.q
        self.r = hex.r
        self.s = hex.s
    }
    var hex: Hex {
        Hex(q: q, r: r, s: s)
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

struct HexagonBoardView: View {
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

struct HexBoardView: View {
    var body: some View {
        VStack {
            Text("Hello, Hex World!")
            Polygon(corners: centerHexCorners).stroke(.red)
//            Polygon2(layout: layout, hex: Hex(q: 2, r: 2, s: -4)).stroke(.blue)
            Polygon2(layout: layout, hex: Hex(q: 0, r: 0, s: 0)).stroke(.blue)
            HexagonBoardView(hexes2: [
                Hex2(hex: Hex(q: 0, r: 0, s: 0)),
                Hex2(hex: Hex(q: 0, r: 1, s: -1)),
                Hex2(hex: Hex(q: 0, r: -1, s: 1)),
                                     ])
        }
    }
}

struct HexBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HexBoardView()
    }
}
