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
        if let repeatsAfter = findRepetition(programs: programs, dance: dance) {
            print("Repeats after \(repeatsAfter) dances")
            var result = programs
            for _ in 1...(1000000000 % repeatsAfter) {
                result = dance.perform(programs: result)
            }
            print("Order after a billion dances: \(result)")
        }
    }

    private class func findRepetition(programs: [String], dance: Dance) -> Int? {
        var state = programs
        for i in 1...1000 {
            state = dance.perform(programs: state)
            if state == programs {
                return i
            }
        }
        return nil
    }
}
