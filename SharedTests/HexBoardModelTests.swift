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

    func test_hexRing() {
        do {
            let ring = hexRing(radius: -1)
            XCTAssertEqual(ring.count, 1)
            XCTAssertEqual(ring[0], Hex(q: 0, r: 0, s: 0))
        }
        do {
            let ring = hexRing(radius: 0)
            XCTAssertEqual(ring.count, 1)
            XCTAssertEqual(ring[0], Hex(q: 0, r: 0, s: 0))
        }
        do {
            let ring = hexRing(radius: 3)
            XCTAssertEqual(ring.count, 18)
        }
        do {
            XCTAssertEqual(hexRingWidth(radius: -1), 2)
            XCTAssertEqual(hexRingWidth(radius: 0), 2)
            XCTAssertEqual(hexRingWidth(radius: 1), 5)
            XCTAssertEqual(hexRingWidth(radius: 2), 8)
            XCTAssertEqual(hexRingWidth(radius: 3), 11)
        }
    }

    func test_hexSpiral() {
        do {
            let spiral = hexSpiral(radius: -1)
            XCTAssertEqual(spiral.count, 1)
        }
        do {
            let spiral = hexSpiral(radius: 0)
            XCTAssertEqual(spiral.count, 1)
        }
        do {
            let spiral = hexSpiral(radius: 3)
            XCTAssertEqual(spiral.count, 37)
        }
        do {
            XCTAssertEqual(spiralN(for: 3), 37)

            XCTAssertEqual(spiralR(for: 38), 4)
            XCTAssertEqual(spiralR(for: 37), 3)
            XCTAssertEqual(spiralR(for: 36), 3)
            XCTAssertEqual(spiralR(for: 20), 3)
            XCTAssertEqual(spiralR(for: 19), 2)
        }
    }
}
