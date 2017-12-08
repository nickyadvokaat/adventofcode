//
//  Challenge4.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge4 {

    class func run() {
        if let numberOfValidPassphrases = numberOfValidPassPhrases() {
            print("Number of valid passphrases: \(numberOfValidPassphrases)")
        }
        if let numberOfValidPassphrasesNoAnagrams = numberOfValidPassPhrases(allowingAnagrams: false) {
            print("Number of valid passphrases without anagrams: \(numberOfValidPassphrasesNoAnagrams)")
        }
    }

    class func numberOfValidPassPhrases(allowingAnagrams anagrams: Bool = true) -> Int? {
        guard let reader = LineReader(path: "/Users/nad21491/Desktop/Advent/Advent/Advent/Input/data4.txt") else {
            return nil
        }
        return reader.reduce(0, {
            var array = $1.components(separatedBy: " ")
            if !anagrams {
                array = array.map({$0.sortedByCharacters()})
            }
            let set = Set(array)
            return array.count == set.count ? $0! + 1 : $0
        })
    }
}
