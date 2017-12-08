//
//  RegisterCollection.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class RegisterCollection {
    private var registers: [Register]
    var largestValueEver: Int?
    var largestValue: Int? {
        guard let value = registers.first?.value else {
            return nil
        }
        return registers.reduce(value, { return max($0, $1.value) })
    }

    init() {
        registers = []
    }

    func process(instructions: [Instruction]) {
        for instruction in instructions {
            process(instruction: instruction)
        }
    }

    private func process(instruction: Instruction) {
        let conditionRegister = getRegister(withName: instruction.conditionRegister)
        let op = instruction.conditionOperator
        if op(conditionRegister.value, instruction.conditionAmount) {
            let register = getRegister(withName: instruction.register)
            let intOp = instruction.action.intOperator
            register.value = intOp(register.value, instruction.amount)

            if largestValueEver == nil || register.value > largestValueEver! {
                largestValueEver = register.value
            }
        }
    }

    private func getRegister(withName name: String) -> Register {
        if let register = registers.filter({$0.name == name}).first {
            return register
        } else {
            let register = Register(name: name)
            registers.append(register)
            return register
        }
    }
}
