//
//  HexBoardModel.swift
//  HexGridDemo
//
//  Created by Rudolf Farkas on 26.11.21.
//

import HexGrid
import SwiftUI

/// Ring of Hex
/// - Parameters:
///   - center: center Hex
///   - radius:
/// - Returns: [Hex], all at a distance 'radius` from the center
func hexRing(center: Hex = Hex(q: 0, r: 0, s: 0), radius: Int) -> [Hex] {
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

/// Spiral of Hex
/// - Parameters:
///   - center: center Hex
///   - radius:
/// - Returns: [Hex] at a distance 0...radius from the center
func hexSpiral(center: Hex = Hex(q: 0, r: 0, s: 0), radius: Int) -> [Hex] {
    var hexes = [Hex]()
    for r in 0 ... radius {
        hexes += hexRing(center: center, radius: r)
    }
    return hexes
}

/// Number of Hex cells in a spiral of radius
/// - Parameter radius:
/// - Returns: number of cells
func spiralN(for radius: Int) -> Int {
    1 + radius * (radius + 1) * 3
}

func spiralR(for n: Int) -> Int {
    for radius in 0 ... Int.max {
        if spiralN(for: radius) >= n {
            return radius
        }
    }
    return 0
}

struct HexBoardModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HexBoardModel_Previews: PreviewProvider {
    static var previews: some View {
        HexBoardModel()
    }
}
