//
//  Challenge17.swift
//  Advent
//
//  Created by Nicky Advokaat on 17/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge17 {
    class func run() {
        let spinLock = SpinLock(stepsForwardPerInsert: 304)

        let valueAfterLastWrittenValue = spinLock.getLastWrittenValue(forTarget: 2017)
        print("Value after 2017: \(valueAfterLastWrittenValue)")
        
        let valueAfterZero = spinLock.valueAfterZero(forTarget: 50000000)
        print("Value after 0 after 50000000: \(valueAfterZero)")
    }
}

class SpinLock {
    private let stepsForwardPerInsert: Int

    init(stepsForwardPerInsert: Int) {
        self.stepsForwardPerInsert = stepsForwardPerInsert
    }

    func getLastWrittenValue(forTarget target: Int) -> Int {
        var values: [Int] = [0]
        var currentPosition = 0
        for i in 1...target {
            values.insert(i, at: currentPosition + 1)
            currentPosition = (currentPosition + stepsForwardPerInsert + 1) % values.count
        }
        let indexOfTarget = values.index(of: target)!
        return values[(indexOfTarget + 1) % values.count]
    }

    func valueAfterZero(forTarget target: Int) -> Int {
        var currentPosition = 0
        var valuesArrayCount = 1
        var valueAt1 = 0
        for i in 1...target {
            valuesArrayCount += 1
            if currentPosition == 0 {
                valueAt1 = i
            }
            currentPosition = (currentPosition + stepsForwardPerInsert + 1) % valuesArrayCount
        }
        return valueAt1
    }
}
