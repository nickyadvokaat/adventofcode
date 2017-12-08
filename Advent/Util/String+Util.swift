//
//  String+Subscript.swift
//  Advent
//
//  Created by Nicky Advokaat on 05/12/2017.
//  Copyright © 2017 Nicky Advokaat. All rights reserved.
//

import Foundation

extension String {
    subscript (index: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: index)
        return self[charIndex]
    }

    func removingOccurrences(of target: String) -> String {
        return self.replacingOccurrences(of: target, with: "")
    }

    func substring(with nsrange: NSRange) -> Substring? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return self[range]
    }
}
