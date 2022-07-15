//
//  ViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    private let presenter = CounterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
    }
    
    @IBAction func countUp(_ sender: Any) {
        presenter.incrementCount()
    }
    
    @IBAction func countDown(_ sender: Any) {
        presenter.decrementCount()
    }
    
    @IBAction func countReset(_ sender: Any) {
        presenter.resetCount()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let next = Counter2ViewController()
        present(next, animated: true)
    }
    
    @IBAction func counter3(_ sender: Any) {
        let next = Counter3ViewController()
        present(next, animated: true)
    }
    
    @IBAction func wkWeb(_ sender: Any) {
        let next = WKWebViewController()
        present(next, animated: true)
    }
    
    @IBAction func wkWeb2(_ sender: Any) {
        let next = WKWeb2ViewController()
        present(next, animated: true)
    }
    
    @IBAction func wkWeb3(_ sender: Any) {
        let next = WKWeb3ViewController()
        present(next, animated: true)
    }
    
}

extension ViewController: CounterDelegate {
    func updateCount(count: Int) {
        countLabel.text = String(count)
    }
}
