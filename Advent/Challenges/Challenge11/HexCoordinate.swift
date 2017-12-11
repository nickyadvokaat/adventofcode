//
//  HexCoordinate.swift
//  Advent
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

struct HexCoordinate {
    var x: Int
    var y: Int

    var distance: Int {
        let values = [abs(x), abs(y), abs(y - x)]
        return values.max()!
    }

    mutating func move(intoDirection direction: HexDirection) {
        switch direction {
        case .north:
            y += 1
            break
        case .northEast:
            x += 1
            y += 1
            break
        case .southEast:
            x += 1
            break
        case .south:
            y -= 1
            break
        case .southWest:
            x -= 1
            y -= 1
            break
        case .northWest:
            x -= 1
            break
        }
    }
}

enum HexDirection: String {
    case north = "n"
    case northEast = "ne"
    case southEast = "se"
    case south = "s"
    case southWest = "sw"
    case northWest = "nw"
}
