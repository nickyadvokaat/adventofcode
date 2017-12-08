//
//  Challenge8.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge8 {

    class func run() {
        guard let instructions = InstructionParser.getInstructions() else {
            return
        }

        let registerCollection = RegisterCollection()
        registerCollection.process(instructions: instructions)

        if let answer1 = registerCollection.largestValue {
            print("Largest value in any register: \(answer1)")
        }
        if let answer2 = registerCollection.largestValueEver {
            print("Largest value ever held in any register: \(answer2)")
        }
    }
}
