//
//  DiagramCoordinate.swift
//  Advent
//
//  Created by Nicky Advokaat on 19/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

struct DiagramCoordinate: Hashable {
    let x: Int
    let y: Int
    var hashValue: Int {
        return (x + y) * ( x + y + 1) / 2 + y
    }

    static func ==(lhs: DiagramCoordinate, rhs: DiagramCoordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
