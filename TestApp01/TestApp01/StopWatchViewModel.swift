//
//  StopWatchViewModel.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/08.
//

import Foundation
import RxSwift
import RxCocoa

protocol StopWatchViewModelInputs: AnyObject {
    var isPauseTimer: PublishRelay<Bool> { get }
    var isResetButtonTaped: PublishRelay<Void> { get }
}

protocol StopWatchViewModelOutput: AnyObject {
    var isTimerWorked: Driver<Bool> { get }
    var timerText: Driver<String> { get }
    var isResetButtonHidden: Driver<Bool> { get }
}

protocol StopWatchViewModelType: AnyObject {
    var inputs: StopWatchViewModelInputs { get }
    var outputs: StopWatchViewModelOutput { get }
}

final class StopWatchViewModel: StopWatchViewModelType, StopWatchViewModelInputs,StopWatchViewModelOutput {
    var inputs: StopWatchViewModelInputs { return self }
    var outputs: StopWatchViewModelOutput { return self }
    
    var isPauseTimer = PublishRelay<Bool>()
    var isResetButtonTaped = PublishRelay<Void>()
    
    var isTimerWorked: Driver<Bool>
    var timerText: Driver<String>
    var isResetButtonHidden: Driver<Bool>
    
    private let disposeBag = DisposeBag()
    private let totalTimeDuration = BehaviorRelay<Int>(value: 0)
    
    init() {
        isTimerWorked = isPauseTimer.asDriver(onErrorDriveWith: .empty())

        timerText = totalTimeDuration
            .map { String("\(Double($0) / 10)") }
            .asDriver(onErrorDriveWith: .empty())
        
        isResetButtonHidden = Observable.merge(isTimerWorked.asObservable(), isResetButtonTaped.map { _ in true }.asObservable())
            .skip(1)
            .asDriver(onErrorDriveWith: .empty())

        isTimerWorked.asObservable()
            .flatMapLatest { [weak self] isWorked -> Observable<Int> in
                if isWorked {
                    return Observable<Int>.interval(.milliseconds(100), scheduler: MainScheduler.instance)
                        .withLatestFrom(Observable<Int>.just(self?.totalTimeDuration.value ?? 0)) { ($0 + $1) }
                } else {
                    return Observable<Int>.just(self?.totalTimeDuration.value ?? 0)
                }
             }
            .bind(to: totalTimeDuration)
            .disposed(by: disposeBag)

        isResetButtonTaped.map { _ in 0 }
            .bind(to: totalTimeDuration)
            .disposed(by: disposeBag)
    }
    
}
