//
//  MazeSquare.swift
//  Advent
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

struct MazeSquare {
    var x: Int
    var y: Int
    var number: Int

    var manhattanDistance: Int {
        return abs(x) + abs(y)
    }

    func isAdjacent(toMazeSquare square: MazeSquare) -> Bool {
        return abs(square.x - x) <= 1 && abs(square.y - y) <= 1
    }
}
