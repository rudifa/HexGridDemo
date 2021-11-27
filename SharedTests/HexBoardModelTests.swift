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
            let ring = hexRing(radius: 0)
            XCTAssertEqual(ring.count, 1)
        }
        do {
            let ring = hexRing(radius: 3)
            XCTAssertEqual(ring.count, 18)
        }
    }

    func test_hexSpiral() {
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
