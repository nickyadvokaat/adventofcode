//
//  Challenge16.swift
//  Advent
//
//  Created by Nicky Advokaat on 15/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge16 {

    class func run() {
        guard
            let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data16.txt"),
            let line = reader.nextLine else {
                return
        }

        let dance = DanceParser.parseDance(instructions: line)
        let programs: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
        guard let repeatsAfter = dance.findRepetition(inPrograms: programs) else {
            return
        }

        let remainder = 1000000000 % repeatsAfter
        let result = dance.perform(onPrograms: programs, times: remainder)

        print("Repeats after \(repeatsAfter) dances")
        print("Order after a billion dances: \(result)")
    }
}

