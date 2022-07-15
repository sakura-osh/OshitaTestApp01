//
//  Counter3ViewModel.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/14.
//

import Foundation
import RxSwift
import RxCocoa

struct Counter3ViewModelInput {
    let countUpButton: Observable<Void>
    let countDownButton: Observable<Void>
    let countResetButton: Observable<Void>
}

protocol Counter3ViewModelOutput {
    var counterText: Driver<String?> { get }
}

protocol Counter3ViewModelType {
    var outputs: Counter3ViewModelOutput? { get }
    func setup(input: Counter3ViewModelInput)
}

class Counter3ViewModel: Counter3ViewModelType {
    var outputs: Counter3ViewModelOutput?
    
    private let countRelay = BehaviorRelay<Int>(value: 0)
    private let initialCount = 0
    private let disposeBag = DisposeBag()
    
    init() {
        self.outputs = self
        resetCount()
    }
    
    func setup(input: Counter3ViewModelInput) {
        input.countUpButton
            .subscribe(onNext: { [weak self] in
                self?.incrementCount()
            })
            .disposed(by: disposeBag)
        
        input.countDownButton
            .subscribe(onNext: { [weak self] in
                self?.decrementCount()
            })
            .disposed(by: disposeBag)
        
        input.countResetButton
            .subscribe(onNext: { [weak self] in
                self?.resetCount()
            })
            .disposed(by: disposeBag)
    }
    
    private func incrementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }
    
    private func decrementCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }
    
    private func resetCount() {
        countRelay.accept(initialCount)
    }
}

extension Counter3ViewModel: Counter3ViewModelOutput {
    var counterText: Driver<String?> {
        return countRelay
            .map { "Rxパターン：\($0)"}
            .asDriver(onErrorJustReturn: nil)
    }
    
}
