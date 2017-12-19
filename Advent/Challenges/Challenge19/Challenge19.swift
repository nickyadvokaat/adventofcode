//
//  Challenge19.swift
//  Advent
//
//  Created by Nicky Advokaat on 19/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge19 {
    class func run() {
        if
            let diagram = DiagramParser.parseDiagram(),
            let (solution, numberOfSteps) = diagram.findSolution() {
            print("Solution is '\(solution)' found in \(numberOfSteps) steps")
        }
    }
}
