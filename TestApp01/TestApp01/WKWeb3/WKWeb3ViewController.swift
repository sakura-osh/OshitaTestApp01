//
//  WKWebViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/14.
//

import Foundation
import UIKit
import WebKit
import RxSwift
import RxCocoa
import RxOptional
import RxWebKit

class WKWeb3ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        let loadingObservable = webView.rx.loading
            .share()
        
        loadingObservable
            .map { return !$0 }
            .observeOn(MainScheduler.instance)
            .bind(to: progressView.rx.isHidden)
            .disposed(by: disposeBag)
        
        loadingObservable
            .bind(to: UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
//        webView.rx.title
//            .filterNil()
//            .observe(on: MainScheduler.instance)
//            .bind(to: navigationItem.rx.progress)
//            .disposed(by: disposeBag)
        
        webView.rx.estimatedProgress
            .map { return Float($0) }
            .observeOn(MainScheduler.instance)
            .bind(to: progressView.rx.progress)
            .disposed(by: disposeBag)
        
        let url = URL(string: "https://www.google.com/")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }
}
