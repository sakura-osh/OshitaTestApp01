//
//  CounterPresenter.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/14.
//

import Foundation

protocol CounterDelegate {
    func updateCount(count: Int)
}

class CounterPresenter {
    private var delegate: CounterDelegate?
    private var count = 0 {
        didSet {
            delegate?.updateCount(count: count)
        }
    }
    
    func attachView(_ delegate: CounterDelegate) {
        self.delegate = delegate
    }
    
    func datachView() {
        self.delegate = nil
    }
    
    func incrementCount() {
        count += 1
    }
    
    func decrementCount() {
        count -= 1
    }
    
    func resetCount() {
        count = 0
    }
    
}
