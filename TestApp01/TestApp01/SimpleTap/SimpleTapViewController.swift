//
//  SampleViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/12.
//

import Foundation
import UIKit

class SimpleTapViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func tapLoginButton(_ sender: Any) {
        messageLabel.text = "Tap Login Button!"
    }
    
    @IBAction func tapExitButton(_ sender: Any) {
        messageLabel.text = "Tap Exit Button!"
    }
    
    @IBAction func tapHelpButton(_ sender: Any) {
        messageLabel.text = "Tap Help Button!"
    }
    
}
