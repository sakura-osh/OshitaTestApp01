//
//  SimpleRxTapViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/12.
//

import Foundation
import RxSwift
import RxCocoa

class SimpleRxTapViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap Login Button"
            })
            .disposed(by: disposeBag)
        
        resetPasswordButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap reset Password Button"
            })
            .disposed(by: disposeBag)
        
        exitButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap exit Button"
            })
            .disposed(by: disposeBag)
        
        helpButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap help Button"
            })
            .disposed(by: disposeBag)
    }
}
