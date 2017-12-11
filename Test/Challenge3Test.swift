//
//  Challenge3Test.swift
//  Test
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import XCTest

class Challenge3Test: XCTestCase {

    func testIsAdjacent() {
        var mazeSquare1 = MazeSquare(x: 0, y: 0, number: 5)
        var mazeSquare2 = MazeSquare(x: 3, y: 5, number: 5)
        assert(mazeSquare1.isAdjacent(toMazeSquare: mazeSquare2) == false)

        mazeSquare1 = MazeSquare(x: 0, y: 0, number: 5)
        mazeSquare2 = MazeSquare(x: 1, y: -1, number: 5)
        assert(mazeSquare1.isAdjacent(toMazeSquare: mazeSquare2) == true)

        mazeSquare1 = MazeSquare(x: 1, y: 0, number: 5)
        mazeSquare2 = MazeSquare(x: -1, y: 1, number: 5)
        assert(mazeSquare1.isAdjacent(toMazeSquare: mazeSquare2) == false)
    }

    func testManhattanDistance() {
        let mazeSquare = MazeSquare(x: 5, y: -7, number: 5)
        assert(mazeSquare.manhattanDistance == 12)
    }
}
