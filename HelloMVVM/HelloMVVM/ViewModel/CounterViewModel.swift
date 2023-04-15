//
//  CounterViewModel.swift
//  HelloMVVM
//
//  Created by Heonjin Ha on 2023/04/15.
//

import SwiftUI

class CounterViewModel: ObservableObject {

    @Published private var counter: Counter = Counter()

    var count: Int {
        counter.count
    }

    var premium: Bool {
        counter.premium
    }

    func increase() {
        counter.incresement()
    }

}
