//
//  Dance.swift
//  Advent
//
//  Created by Nicky Advokaat on 16/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Dance {
    private let danceInstructions: [DanceInstruction]

    init(danceInstructions: [DanceInstruction]) {
        self.danceInstructions = danceInstructions
    }

    func perform(onPrograms programs: [String], times: Int = 1) -> [String] {
        var result = programs
        for _ in 1...times {
            for danceInstruction in danceInstructions {
                danceInstruction.perform(programs: &result)
            }
        }
        return result
    }

    func findRepetition(inPrograms programs: [String]) -> Int? {
        var state = programs
        for i in 1...1000 {
            state = perform(onPrograms: state)
            if state == programs {
                return i
            }
        }
        return nil
    }
}
