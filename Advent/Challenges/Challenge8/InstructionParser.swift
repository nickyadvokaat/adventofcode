//
//  InstructionParser.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class InstructionParser {
    
    class func getInstructions() -> [Instruction]? {
        var instructions: [Instruction] = []

        guard let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data8.txt") else {
            return nil
        }

        for line in reader {
            guard let instruction = instruction(forLine: line) else {
                return nil
            }
            instructions.append(instruction)
        }
        return instructions
    }

    private class func instruction(forLine line: String) -> Instruction? {
        do {
            let pattern = "([a-z]+) (inc|dec) (-?\\d+) if ([a-z]+) (\\S+) (-?\\d+)"
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let matches = regex.matches(in: line, options: [], range: NSRange(location: 0, length: line.count))
            var results: [String] = []
            for match in matches {
                for n in 1..<match.numberOfRanges {
                    let range = match.range(at: n)
                    let x = line.substring(with: range)!
                    results.append(String(x))
                }
            }
            guard results.count == 6 else {
                return nil
            }
            let register = results[0]
            let conditionRegister = results[3]
            guard
                let action = InstructionAction(rawValue: results[1]),
                let amount = Int(results[2]),
                let conditionOperator: IntCompareOperator = getIntOperator(fromString: results[4]),
                let conditionAmount = Int(results[5]) else {
                    return nil
            }
            let instruction = Instruction(register: register, action: action, amount: amount, conditionRegister: conditionRegister, conditionOperator: conditionOperator, conditionAmount: conditionAmount)
            return instruction
        } catch {
            return nil
        }
    }

    private class func getIntOperator(fromString string: String) -> IntCompareOperator? {
        switch string {
        case "==":
            return (==)
        case "!=":
            return (!=)
        case "<=":
            return (<=)
        case "<":
            return (<)
        case ">=":
            return (>=)
        case ">":
            return (>)
        default:
            return nil
        }
    }
}
