//
//  Challenge15.swift
//  Advent
//
//  Created by Nicky Advokaat on 15/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge15 {

    class func run() {
        part1()
        part2()
    }

    private class func part1() {
        let generatorA = Generator(start: 116, factor: 16807)
        let generatorB = Generator(start: 299, factor: 48271)
        let count = Judge.count(forNumberOfPairs: 40000000, generatorA: generatorA, generatorB: generatorB)
        print("The judge's final count: \(count)")
    }

    private class func part2() {
        let generatorA = Generator(start: 116, factor: 16807, useMultiplesOf: 4)
        let generatorB = Generator(start: 299, factor: 48271, useMultiplesOf: 8)
        let count = Judge.count(forNumberOfPairs: 5000000, generatorA: generatorA, generatorB: generatorB)
        print("The judge's final count: \(count)")
    }
}
