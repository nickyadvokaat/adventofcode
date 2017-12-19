//
//  Direction.swift
//  Advent
//
//  Created by Nicky Advokaat on 19/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

enum Direction: Int {
    case North = 0
    case East
    case South
    case West

    func left() -> Direction {
        return Direction(rawValue: (rawValue + 3) % 4)!
    }

    func right() -> Direction {
        return Direction(rawValue: (rawValue + 1) % 4)!
    }
}
