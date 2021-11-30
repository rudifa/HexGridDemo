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
            .stroke()
            .frame(width: 200, height: 200, alignment: .leading)
            .offset(x: 0, y: 0)
    }
}

struct CircleView: View {
    var body: some View {
        GeometryReader { _ in
            Circle()
                .stroke()
            //               .frame(width: 200, height: 200)

            // in the absence of frame center goes to bottomTrailing corner
            // .offset(x: geometry.size.width/2, y: geometry.size.height/2)
        }
    }
}

struct HexagonView3: View {
    let size: CGSize
    let center: CGPoint
    var body: some View {
        Hexagon()
            .stroke(.red)
            .frame(width: size.width, height: size.height)
            .position(x: center.x, y: center.y)
    }
}

// TODO:
// - simplify offset and frame size parameters for Hexagon
// - revise rotation - had a crash

// OK but not understood offsets
struct HexRingBoardView2: View {
    let radius = 1
    var ring: HexRing { HexRing(center: .zero, radius: radius)}

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let hexSize = size / CGFloat(ring.width)
            let layout = Layout(orientation: Layout.flat,
                                size: Point(x: hexSize, y: hexSize),
                                origin: Point(x: geometry.size.width / 2, y: geometry.size.height / 2))
            let points = ring.hexes.map { Point2(point: layout.hexToPixel(h: $0)) }
            // let _ = print("### hexes.count= \(hexes.count)")
            // let _ = print("size= \(size) layout= \(layout)")
            ZStack {
                ForEach(points) { point in
                    Hexagon()
                        .stroke()
                        .frame(width: hexSize * 2, height: hexSize * 2)
                        .offset(x: point.x - hexSize, y: point.y - hexSize)

                    // Hexagons are sized and positioned as desired;
                    // need to understand the correction -hexSize
                    // more generally, relation between frame and offset
                }
            }
        }
    }
}

// LOOKS GOOD
struct HexRingBoardView3: View {
    let radius = 3
    var ring: HexRing { HexRing(center: .zero, radius: radius)}

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let hexSide = size / CGFloat(ring.width)
            let hexSize = CGSize(width: hexSide * 2, height: hexSide * 2)
            let hexSize2 = CGSize(width: hexSide, height: hexSide)
            let layout = Layout(orientation: Layout.flat,
                                size: Point(x: hexSide, y: hexSide),
                                origin: Point(x: geometry.size.width / 2, y: geometry.size.height / 2))
            let points = ring.hexes.map { Point2(point: layout.hexToPixel(h: $0)) }
            // let _ = print("### hexes.count= \(hexes.count)")
            // let _ = print("size= \(size) layout= \(layout)")
            ZStack {
                ForEach(points) { point in
                    HexagonView3(size: hexSize, center: CGPoint(x: point.x, y: point.y))
                    HexagonView3(size: hexSize2, center: CGPoint(x: point.x, y: point.y))
                    CircleView()
                }
            }
        }
    }
}

// TODO SpiralBoardView with decorated Hex
// Should take an array of View
// Look at the Set Game and emulate the CardModel and the CardView

struct HexBoards2View: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HexBoards2View_Previews: PreviewProvider {
    static var previews: some View {
        HexRingBoardView3()
        // HexagonView()
    }
}
