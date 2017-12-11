//
//  Challenge11.swift
//  Advent
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge11 {

    class func run() {
        guard
            let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data11.txt"),
            let input = reader.nextLine else {
                return
        }

        let steps: [String] = input.split(separator: ",").map(String.init)
        let (distance, maxDistance) = calculateDistanceInHexMap(fromSteps: steps)
        print("Current distance: \(distance)")
        print("Maximum distance: \(maxDistance)")
    }

    class func calculateDistanceInHexMap(fromSteps steps: [String]) -> (Int, Int) {
        var maxDistance = 0
        var hexCoordinate = HexCoordinate(x: 0,y: 0)
        for step in steps {
            if let hexDirection = HexDirection(rawValue: step) {
                hexCoordinate.move(intoDirection: hexDirection)
                maxDistance = max(maxDistance, hexCoordinate.distance)
            }
        }
        let distance = hexCoordinate.distance
        return (distance, maxDistance)
    }
}
