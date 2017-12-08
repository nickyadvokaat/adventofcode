//
//  Instruction.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

typealias IntOperator = (Int, Int) -> Int
typealias IntCompareOperator = (Int, Int) -> Bool

struct Instruction {
    let register: String
    let action: InstructionAction
    let amount: Int
    let conditionRegister: String
    let conditionOperator: IntCompareOperator
    let conditionAmount: Int
}

enum InstructionAction: String {
    case inc = "inc"
    case dec = "dec"

    var intOperator: IntOperator {
        switch self {
        case .inc:
            return (+)
        case .dec:
            return (-)
        }
    }
}
