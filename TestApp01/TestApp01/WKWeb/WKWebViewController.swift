//
//  WKWebViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/14.
//

import Foundation
import UIKit
import WebKit

class WKWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "estimetedProgress", options: .new, context: nil)
        
        let url = URL(string: "https://www.google.com/")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        progressView.setProgress(0.1, animated: true)
    }
    
    deinit {
        webView?.removeObserver(self, forKeyPath: "loading")
        webView?.removeObserver(self, forKeyPath: "estimetedProgress")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            UIApplication.shared.isNetworkActivityIndicatorVisible = webView.isLoading
            if !webView.isLoading {
                progressView.setProgress(0.0, animated: false)
                navigationItem.title = webView.title
            }
        }
        if keyPath == "estimetedProgress" {
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
}
