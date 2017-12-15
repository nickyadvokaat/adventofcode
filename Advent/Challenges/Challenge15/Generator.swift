//
//  Generator.swift
//  Advent
//
//  Created by Nicky Advokaat on 15/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Generator {
    private let factor: Int
    private var lastValue: Int
    private let useMultiplesOf: Int?
    private let divider = 2147483647

    init(start: Int, factor: Int, useMultiplesOf: Int? = nil) {
        self.lastValue = start
        self.factor = factor
        self.useMultiplesOf = useMultiplesOf
    }

    func nextValue() -> Int {
        if let multiples = useMultiplesOf {
            repeat {
                lastValue = (lastValue * factor) % divider
            } while lastValue % multiples != 0
        } else {
            lastValue = (lastValue * factor) % divider
        }
        return lastValue
    }
}
