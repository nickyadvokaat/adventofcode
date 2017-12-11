//
//  Maze.swift
//  Advent
//
//  Created by Nicky Advokaat on 11/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Maze {
    private var squares: [MazeSquare]
    var lastSquare: MazeSquare {
        return squares.last!
    }
    private var direction: MazeDirection
    private var shouldSumAdjacent: Bool

    private var stepsToDo = 1
    private var stepsRemaining = 1
    private var stepsToRepeat = 2

    init(shouldSumAdjacent: Bool = false) {
        self.shouldSumAdjacent = shouldSumAdjacent
        squares = [MazeSquare(x: 0, y: 0, number: 1)]
        direction = .right
    }

    func generateMaze(forTarget target: Int) {
        while lastSquare.number < target {
            next()
        }
    }

    private func next() {
        squares.append(nextSquare())
        stepsRemaining -= 1
        if stepsRemaining == 0 {
            stepsToRepeat -= 1
            if stepsToRepeat == 0 {
                stepsToDo += 1
                stepsToRepeat = 2
            }
            stepsRemaining = stepsToDo
            direction = direction.next
        }
    }

    private func nextSquare() -> MazeSquare {
        var nextSquare = lastSquare
        switch direction {
        case .right:
            nextSquare.x += 1
        case .up:
            nextSquare.y += 1
        case .left:
            nextSquare.x -= 1
        case .down:
            nextSquare.y -= 1
        }

        if shouldSumAdjacent {
            let adjacent = adjacentSquares(toMazeSquare: nextSquare)
            let sum = adjacent.reduce(0, {$0 + $1.number})
            nextSquare.number = sum
        } else {
            nextSquare.number += 1
        }

        return nextSquare
    }

    private func adjacentSquares(toMazeSquare square: MazeSquare) -> [MazeSquare] {
        return squares.filter({$0.isAdjacent(toMazeSquare: square)})
    }
}
