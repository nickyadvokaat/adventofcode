//
//  Challenge11Test.swift
//  Test
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import XCTest

class Challenge11Test: XCTestCase {

    func testCalculateDistanceInHexMap() {
        var steps = ["ne","ne","ne"]
        var (distance, maxDistance) = Challenge11.calculateDistanceInHexMap(fromSteps: steps)
        assert(distance == 3)
        assert(maxDistance == 3)

        steps = ["ne","ne","sw","sw"]
        (distance, maxDistance) = Challenge11.calculateDistanceInHexMap(fromSteps: steps)
        assert(distance == 0)
        assert(maxDistance == 2)

        steps = ["se","sw","se","sw","sw"]
        (distance, maxDistance) = Challenge11.calculateDistanceInHexMap(fromSteps: steps)
        assert(distance == 3)
        assert(maxDistance == 3)
    }
}
