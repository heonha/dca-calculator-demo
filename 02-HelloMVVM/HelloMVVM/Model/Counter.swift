//
//  Counter.swift
//  HelloMVVM
//
//  Created by Heonjin Ha on 2023/04/14.
//

import Foundation

struct Counter {

    var count: Int = 0
    var premium: Bool {
        if count.isMultiple(of: 3) {
            return true
        } else {
            return false
        }
    }

    mutating func incresement() {
        self.count += 1
    }

}
