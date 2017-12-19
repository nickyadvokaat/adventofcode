//
//  DiagramParser.swift
//  Advent
//
//  Created by Nicky Advokaat on 19/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class DiagramParser {
    class func parseDiagram() -> Diagram? {
        guard
            let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data19.txt") else {
                return nil
        }
        let diagram = Diagram()
        var lineNr = 0
        var characterNr = 0
        for line in reader {
            for character in line {
                if character != " " {
                    let coordinate = DiagramCoordinate(x: characterNr, y: lineNr)
                    diagram.addLine(character: character, coordinate: coordinate)
                }
                characterNr += 1
            }
            lineNr += 1
            characterNr = 0
        }
        return diagram
    }
}
