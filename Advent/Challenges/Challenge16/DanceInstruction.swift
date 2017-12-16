//
//  DanceInstruction.swift
//  Advent
//
//  Created by Nicky Advokaat on 16/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

protocol DanceInstruction {
    func perform(programs: inout [String])
}

class SpinDanceInstruction: DanceInstruction {
    private let size: Int

    init(size: Int) {
        self.size = size
    }

    func perform(programs: inout [String]) {
        programs.spin(steps: size)
    }
}

class ExchangeDanceInstruction: DanceInstruction {
    private let positionA: Int
    private let positionB: Int

    init(positionA: Int, positionB: Int) {
        self.positionA = positionA
        self.positionB = positionB
    }

    func perform(programs: inout [String]) {
        programs.swapAt(positionA, positionB)
    }
}

class PartnerDanceInstruction: DanceInstruction {
    private let partnerA: String
    private let partnerB: String

    init(partnerA: String, partnerB: String) {
        self.partnerA = partnerA
        self.partnerB = partnerB
    }

    func perform(programs: inout [String]) {
        if
            let indexA = programs.index(of: partnerA),
            let indexB = programs.index(of: partnerB) {
            programs.swapAt(indexA, indexB)
        }
    }
}

extension Array where Element: Equatable {
    mutating func spin(steps: Int) {
        var new: [Element] = []
        for i in 0..<self.count {
            new.append(self[(i-steps+self.count)%self.count])
        }
        self = new
    }
}
