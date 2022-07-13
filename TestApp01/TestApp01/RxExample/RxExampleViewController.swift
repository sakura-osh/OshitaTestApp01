//
//  RxExampleViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/12.
//

import Foundation
import RxSwift
import RxCocoa
import RxOptional

class RxExampleViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let maxNameFieldSize = 10
    private let maxAddresFieldSize = 50
    
    private let disposeBag = DisposeBag()
    
    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.rx.text
            .map { [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxNameFieldSize = self?.maxNameFieldSize else { return nil }
                let limitCount = maxNameFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        addressField.rx.text
            .map { [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxAddressField = self?.maxAddresFieldSize else { return nil }
                let limitCount = maxAddressField - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: addressLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
