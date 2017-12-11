//
//  MazeDirection.swift
//  Advent
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

enum MazeDirection: Int {
    case right = 0
    case up
    case left
    case down

    var next: MazeDirection {
        return MazeDirection(rawValue: (self.rawValue + 1) % 4)!
    }
}
