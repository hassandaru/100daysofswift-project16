//
//  DetailViewController.swift
//  Project16
//
//  Created by Hassan Sohail Dar on 2/11/2022.
//

import Foundation
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var urlValue = ""
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let close = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.closeAndReturn))

        toolbarItems = [ close]
        navigationController?.isToolbarHidden = false
      
        let url = URL(string: urlValue)!
        webView.load(URLRequest(url: url))

    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    @objc func closeAndReturn () {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
