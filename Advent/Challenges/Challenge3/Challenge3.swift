//
//  Challenge3.swift
//  Advent
//
//  Created by Nicky Advokaat on 10/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge3 {

    static let target = 277678

    class func run() {
        let maze = Maze()
        maze.generateMaze(forTarget: target)
        let manhattanDistance = maze.lastSquare.manhattanDistance
        print("Manhattan distance: \(manhattanDistance)")

        let maze2 = Maze(shouldSumAdjacent: true)
        maze2.generateMaze(forTarget: target)
        let firstValueLargerThanTarget = maze2.lastSquare.number
        print("First value larger than target: \(firstValueLargerThanTarget)")
    }
}
