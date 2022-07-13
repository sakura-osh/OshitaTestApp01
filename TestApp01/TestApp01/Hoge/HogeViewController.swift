//
//  Hoge.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/12.
//

import Foundation
import RxSwift

class HogeViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private var viewModel: HogeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HogeViewModel()
        
        viewModel.helloWorldObservable
            .subscribe(onNext: { [weak self] value in
                print("value = \(value)")
            })
            .disposed(by: disposeBag)
        
        viewModel.updateItem()
    }
}

class HogeViewModel {
    private let helloWorldSubject = PublishSubject<String>()
    
    var helloWorldObservable: Observable<String> {
        return helloWorldSubject.asObserver()
    }
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()
    }
}
