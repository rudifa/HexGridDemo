//
//  HexBoardModel.swift
//  HexGridDemo
//
//  Created by Rudolf Farkas on 26.11.21.
//

import HexGrid
import CoreGraphics

protocol HexBoard {
    // Return an array of Hex
    var hexes: [Hex] { get }
}

struct HexRing: HexBoard {
    let radius: Int
    let center: Hex

    init(center: Hex = Hex.zero, radius: Int) {
        self.radius = max(0, radius)
        self.center = center
    }

    /// Return [Hex], all at a distance radius` from the center
    var hexes: [Hex] {
        if radius <= 0 {
            return [center]
        } else {
            var hexes = [Hex]()
            let dir4 = Hex.direction(direction: 4)
            var hex: Hex = center.plus(b: dir4.scale(k: CGFloat(radius))) // South-West
            for i in 0 ..< 6 {
                for _ in 0 ..< radius {
                    hexes.append(hex)
                    hex = hex.neighbor2(direction: i)
                }
            }
            return hexes
        }
    }

    /// Return the width of the ring, in hex units
    var width: Int {
        2 + 3 * max(radius, 0)
    }
}

struct HexSpiral: HexBoard {
    let n: Int // number of cells
    let center: Hex

    init(center: Hex = .zero, n: Int) {
        self.center = center
        self.n = max(0, n)
    }

    init(center: Hex = .zero, radius: Int) {
        self.center = center
        n = HexSpiral.numberOfCells(for: radius)
    }

    var radius: Int {
        for radius in 0 ... Int.max {
            if HexSpiral.numberOfCells(for: radius) >= n {
                return radius
            }
        }
        return 0
    }

    // Return [Hex] at a distance 0...radius from the center
    var hexes: [Hex] {
        var hexes = [Hex]()
        for r in 0 ... max(radius, 0) {
            hexes += HexRing(center: center, radius: r).hexes
        }
        return hexes
    }

    /// Number of Hex cells in a spiral of radius
    /// - Parameter radius:
    /// - Returns: number of cells
    static func numberOfCells(for radius: Int) -> Int {
        let radius2 = max(radius, 0)
        return 1 + radius2 * (radius2 + 1) * 3
    }
}
