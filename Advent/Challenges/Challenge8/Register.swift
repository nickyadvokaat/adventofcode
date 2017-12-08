//
//  Register.swift
//  Advent
//
//  Created by Nicky Advokaat on 08/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

class Register {
    let name: String
    var value: Int

    init(name: String, value: Int = 0) {
        self.name = name
        self.value = value
    }
}
