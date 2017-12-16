//
//  DanceInstructionParser.swift
//  Advent
//
//  Created by Nicky Advokaat on 16/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class DanceParser {
    class func parseDance(instructions: String) -> Dance {
        var danceInstructions: [DanceInstruction] = []
        let split = instructions.split(separator: ",").map(String.init)
        for instruction in split {
            if let danceInstruction = parseInstruction(instruction: instruction) {
                danceInstructions.append(danceInstruction)
            }
        }
        return Dance(danceInstructions: danceInstructions)
    }

    private class func parseInstruction(instruction: String) -> DanceInstruction? {
        let instructionType = instruction[0]
        let instructionValue = instruction.suffix(instruction.count - 1)
        switch instructionType {
        case "s":
            return SpinDanceInstruction(size: Int(instructionValue)!)
        case "x":
            let splitValue = instructionValue.split(separator: "/")
            let first = Int(splitValue[0])!
            let second = Int(splitValue[1])!
            return ExchangeDanceInstruction(positionA: first, positionB: second)
        case "p":
            let splitValue = instructionValue.split(separator: "/").map(String.init)
            let first = splitValue[0]
            let second = splitValue[1]
            return PartnerDanceInstruction(partnerA: first, partnerB: second)
        default:
            return nil
        }
    }
}
