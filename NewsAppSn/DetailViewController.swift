//
//  DetailViewController.swift
//  NewsAppSn
//
//  Created by Sharon Shen on 6/2/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate {
    var urlString: String? = nil
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        self.view = webView
        
        if let url_string = urlString {
            let request = URLRequest(url: URL(string: url_string)!)
            print("url string is: \(url_string)")
            webView.load(request)
        }
    }
}
