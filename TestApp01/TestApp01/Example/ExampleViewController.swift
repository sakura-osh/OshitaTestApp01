//
//  ExampleViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/12.
//

import Foundation
import UIKit

class ExampleViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let maxNameFieldSize = 10
    private let maxAddresFieldSize = 50
    
    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.addTarget(self,
                            action:
                                #selector(nameFieldEditingChanged(sender:)),
                            for: .editingChanged)
        addressField.addTarget(self,
                               action:
                                #selector(addressFieldEditingChanged(sender:)),
                               for: .editingChanged)
    }
    
    @objc func nameFieldEditingChanged(sender: UITextField) {
        guard let changeText = sender.text else { return }
        let limitCount = maxNameFieldSize - changeText.count
        nameLabel.text = limitText(limitCount)
    }
    
    @objc func addressFieldEditingChanged(sender: UITextField) {
        guard let changeText = sender.text else { return }
        let limitCount = maxAddresFieldSize - changeText.count
        addressLabel.text = limitText(limitCount)
    }
    
}
