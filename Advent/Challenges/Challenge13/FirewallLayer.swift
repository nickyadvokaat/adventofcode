//
//  FirewallLayer.swift
//  Advent
//
//  Created by Nicky Advokaat on 13/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

struct FirewallLayer {
    let depth: Int
    let range: Int

    func isAtZero(atTime time: Int) -> Bool {
        return time % ((range - 1)*2) == 0
    }
}
