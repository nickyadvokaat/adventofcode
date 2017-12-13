//
//  Firewall.swift
//  Advent
//
//  Created by Nicky Advokaat on 13/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Firewall {
    private var layers: [FirewallLayer]
    private var maxDepth: Int {
        return layers.last!.depth
    }

    init() {
        layers = []
    }

    func addLayer(layer: FirewallLayer) {
        layers.append(layer)
    }

    func severityOfTrip() -> Int {
        var severity = 0
        for i in 0...maxDepth {
            if let layer = getLayer(atDepth: i) {
                if layer.isAtZero(atTime: i) {
                    severity += layer.depth * layer.range
                }
            }
        }
        return severity
    }

    func minimumDelayToPass() -> Int? {
        var delay = 0
        while delay < 10000000 {
            if packetCanPass(withDelay: delay) {
                return delay
            }
            delay += 1
        }
        return nil
    }

    private func packetCanPass(withDelay delay: Int = 0) -> Bool {
        for i in 0...maxDepth {
            if let layer = getLayer(atDepth: i) {
                if layer.isAtZero(atTime: i + delay) {
                    return false
                }
            }
        }
        return true
    }

    private func getLayer(atDepth depth: Int) -> FirewallLayer? {
        return layers.filter({$0.depth == depth}).first
    }
}
