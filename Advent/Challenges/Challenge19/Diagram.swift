//
//  Diagram.swift
//  Advent
//
//  Created by Nicky Advokaat on 19/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Diagram {
    var lines: [DiagramCoordinate: Character]

    init() {
        lines = [:]
    }

    func addLine(character: Character, coordinate: DiagramCoordinate) {
        lines[coordinate] = character
    }

    func getStartingCoordinate() -> DiagramCoordinate? {
        for line in lines {
            if line.key.y == 0 {
                return line.key
            }
        }
        return nil
    }

    private func characterAt(coordinate: DiagramCoordinate) -> Character? {
        return lines[coordinate]
    }

    func findSolution() -> (String, Int)? {
        guard let startingCoordinate = getStartingCoordinate() else {
            return nil
        }
        var solution = ""
        var numberOfStepsTaken = 0
        var direction: Direction = .South
        var currentCoordinate = startingCoordinate
        while let character = characterAt(coordinate: currentCoordinate) {
            switch character {
            case "|", "-":
                break
            case "+":
                if characterAt(coordinate: coordinate(inDirection: direction, forCoordinate: currentCoordinate)) == nil {
                    let right = direction.right()
                    if characterAt(coordinate: coordinate(inDirection: right, forCoordinate: currentCoordinate)) != nil  {
                        direction = right
                    }
                    let left = direction.left()
                    if characterAt(coordinate: coordinate(inDirection: left, forCoordinate: currentCoordinate)) != nil  {
                        direction = left
                    }
                }
                break
            default:
                solution += String(character)
                break
            }
            currentCoordinate = coordinate(inDirection: direction, forCoordinate: currentCoordinate)
            numberOfStepsTaken+=1
        }
        return (solution, numberOfStepsTaken)
    }

    private func coordinate(inDirection direction: Direction, forCoordinate coordinate: DiagramCoordinate) -> DiagramCoordinate {
        var x = coordinate.x
        var y = coordinate.y
        switch direction {
        case .North:
            y -= 1
            break
        case .East:
            x += 1
            break
        case .South:
            y += 1
            break
        case .West:
            x -= 1
            break
        }
        return DiagramCoordinate(x: x, y: y)
    }
}

