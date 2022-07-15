//
//  Counter2ViewModel.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/14.
//

import Foundation

class Counter2ViewModel {
    private(set) var count = 0
    
    func incrementCount(callback: (Int) -> ()) {
        count += 1
        callback(count)
    }
    
    func decrementCount(callback: (Int) -> ()) {
        count -= 1
        callback(count)
    }
    
    func resetCount(callback: (Int) -> ()) {
        count = 0
        callback(count)
    }
}
