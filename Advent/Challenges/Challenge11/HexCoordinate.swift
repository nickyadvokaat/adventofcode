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
}
