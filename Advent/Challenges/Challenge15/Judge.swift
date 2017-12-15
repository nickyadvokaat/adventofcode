//
//  Judge.swift
//  Advent
//
//  Created by Nicky Advokaat on 15/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Judge {
    class func count(forNumberOfPairs numberOfPairs: Int, generatorA: Generator, generatorB: Generator) -> Int {
        var result = 0
        for _ in 1...numberOfPairs {
            if matchOfLowest16(a: generatorA.nextValue(), b: generatorB.nextValue()) {
                result += 1
            }
        }
        return result
    }

    private class func matchOfLowest16(a: Int, b: Int) -> Bool {
        let leastSignificat16A = UInt32(a) & UInt32(UInt16.max)
        let leastSignificat16B = UInt32(b) & UInt32(UInt16.max)
        return leastSignificat16A == leastSignificat16B
    }
}

