//
//  Counter2ViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/14.
//

import Foundation
import UIKit

class Counter2ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    
    private var viewModel: Counter2ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = Counter2ViewModel()
    }

    @IBAction func countUp(_ sender: Any) {
        viewModel.incrementCount(callback: { [weak self] count in
            self?.updateCountLabel(count)
        })
    }
    
    @IBAction func countDown(_ sender: Any) {
        viewModel.decrementCount(callback: { [weak self] count in
            self?.updateCountLabel(count)
        })
    }
    
    @IBAction func countReset(_ sender: Any) {
        viewModel.resetCount(callback: { [weak self] count in
            self?.updateCountLabel(count)
        })
    }
    
    private func updateCountLabel(_ count: Int) {
        countLabel.text = String(count)
    }
}
