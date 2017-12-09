//
//  Challenge9.swift
//  Advent
//
//  Created by Nicky Advokaat on 09/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge9 {

    class func run() {
        guard
            let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data9.txt"),
            let stream = reader.nextLine else {
                return
        }

        let (totalScore, numberOfCancelledCharacters) = processStream(forStream: stream)
        print("Total score for stream: \(totalScore)")
        print("Number of cancelled characters: \(numberOfCancelledCharacters)")
    }

    private class func processStream(forStream stream: String) -> (Int, Int) {
        var totalScore = 0
        var numberOfCancelledCharacters = 0

        var level = 0
        var garbage = false

        var i = 0
        while i < stream.count {
            let character = stream[i]
            i += 1
            switch character {
            case "{":
                if garbage {
                    numberOfCancelledCharacters += 1
                } else {
                    level += 1
                }
                break
            case "}":
                if garbage {
                    numberOfCancelledCharacters += 1
                } else {
                    totalScore += level
                    level -= 1
                }
                break
            case "<":
                if garbage {
                    numberOfCancelledCharacters += 1
                } else {
                    garbage = true
                }
                break
            case ">":
                garbage = false
                break
            case "!":
                i += 1
                break
            case ",":
                if garbage {
                    numberOfCancelledCharacters += 1
                }
                break
            default:
                numberOfCancelledCharacters += 1
                break
            }
        }
        return (totalScore, numberOfCancelledCharacters)
    }
}
