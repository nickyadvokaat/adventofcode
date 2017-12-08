//
//  Challenge1.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge1 {

    typealias SecondIndexFunc = (Int, Int) -> (Int)

    static let secondIndexFuncPart1: SecondIndexFunc = { sequenceLength, firstIndex in
        return (firstIndex + 1) % sequenceLength
    }

    static let secondIndexFuncPart2: SecondIndexFunc = { sequenceLength, firstIndex in
        return (firstIndex + (sequenceLength / 2)) % sequenceLength
    }

    class func run() {
        guard
            let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data1.txt"),
            let sequence = reader.nextLine else {
            return
        }

        let result1 = sumOfMatchingDigits(forSequence: sequence, withSecondIndexFunc: secondIndexFuncPart1)
        print("Solution to first Captcha: \(result1)")

        let result2 = sumOfMatchingDigits(forSequence: sequence, withSecondIndexFunc: secondIndexFuncPart2)
        print("Solution to second Captcha: \(result2)")
    }

    class func sumOfMatchingDigits(forSequence sequence: String, withSecondIndexFunc secondIndex: SecondIndexFunc) -> Int {
        var sum = 0
        for firstIndex in 0..<sequence.count {
            let secondIndex: Int = secondIndex(sequence.count, firstIndex)

            let firstChar = sequence[firstIndex]
            let secondChar = sequence[secondIndex]

            if firstChar == secondChar {
                sum += Int(String(firstChar)) ?? 0
            }
        }
        return sum
    }
}
