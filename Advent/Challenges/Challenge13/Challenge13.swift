//
//  Challenge13.swift
//  Advent
//
//  Created by Nicky Advokaat on 13/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Challenge13 {

    class func run() {
        guard
            let reader = LineReader(path: "/Users/nad21491/Xcode Projects/adventofcode/Advent/Input/data13.txt") else {
                return
        }

        let firewall = Firewall()
        for line in reader {
            let split = line.split(separator: ":").map(String.init)
            let depth = Int(split[0])!
            let range = Int(split[1].removingOccurrences(of: " "))!
            let layer = FirewallLayer(depth: depth, range: range)
            firewall.addLayer(layer: layer)
        }

        let severity = firewall.severityOfTrip()
        print("Severity of trip: \(severity)")

        if let delay = firewall.minimumDelayToPass() {
            print("Minimum delay to to pass: \(delay)")
        }
    }
}
