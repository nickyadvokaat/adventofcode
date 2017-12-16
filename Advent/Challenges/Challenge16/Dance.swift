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

    func perform(programs: [String]) -> [String] {
        var result = programs
        for danceInstruction in danceInstructions {
            danceInstruction.perform(programs: &result)
        }
        return result
    }
}
