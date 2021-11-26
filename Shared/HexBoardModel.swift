//
//  HexBoardModel.swift
//  HexGridDemo
//
//  Created by Rudolf Farkas on 26.11.21.
//

import HexGrid
import SwiftUI

// function hexRing(center, radius) {
//  let results = [];
//  if( radius === 0) {
//    results.push( center);
//  } else {
//    const dir4 = hexgrid.Hex.direction(4); // South-West
//    let hex = center.add( dir4.scale( radius));
//    for( let i = 0; i < 6; i++) {
//      for( let j = 0; j < radius; j++) {
//        results.push( hex);
//        hex = hex.neighbor( i);
//      }
//    }
//  }
//  return results;
// }

func hexRing(center: Hex, radius: Int) -> [Hex] {
    if radius <= 0 {
        return [Hex(q: 0, r: 0, s: 0)]
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
