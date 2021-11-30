//
//  HexBoardModelTests.swift
//  Tests iOS
//
//  Created by Rudolf Farkas on 27.11.21.
//

import HexGrid
import XCTest

class HexBoardModelTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_HexRing() {
        do {
            let ring = HexRing(radius: -1)
            XCTAssertEqual(ring.hexes.count, 1)
            XCTAssertEqual(ring.hexes[0], Hex.zero)
        }
        do {
            let ring = HexRing(radius: 0)
            XCTAssertEqual(ring.hexes.count, 1)
            XCTAssertEqual(ring.hexes[0], Hex.zero)
        }
        do {
            let ring = HexRing(radius: 3)
            XCTAssertEqual(ring.hexes.count, 18)
        }
        do {
            XCTAssertEqual(HexRing(radius: -1).width, 2)
            XCTAssertEqual(HexRing(radius: 0).width, 2)
            XCTAssertEqual(HexRing(radius: 1).width, 5)
            XCTAssertEqual(HexRing(radius: 2).width, 8)
            XCTAssertEqual(HexRing(radius: 3).width, 11)
        }
    }

    func test_HexSpiral() {
        do {
            let spiral = HexSpiral(radius: -1)
            XCTAssertEqual(spiral.hexes.count, 1)
        }
        do {
            let spiral = HexSpiral(radius: 0)
            XCTAssertEqual(spiral.hexes.count, 1)
        }
        do {
            let spiral = HexSpiral(radius: 3)
            XCTAssertEqual(spiral.hexes.count, 37)
        }
        do {
            XCTAssertEqual(HexSpiral(radius: 3).n, 37)

            XCTAssertEqual(HexSpiral(n: 38).radius, 4)
            XCTAssertEqual(HexSpiral(n: 37).radius, 3)
            XCTAssertEqual(HexSpiral(n: 36).radius, 3)
            XCTAssertEqual(HexSpiral(n: 20).radius, 3)
            XCTAssertEqual(HexSpiral(n: 19).radius, 2)
        }
    }
}
