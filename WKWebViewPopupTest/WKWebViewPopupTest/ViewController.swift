//
//  ViewController.swift
//  WKWebViewPopupTest
//
//  Created by Hansub Yoo on 2020/10/01.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView!
    var createWebView: WKWebView?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "주소")
        let myRequest = URLRequest(url: myURL!)
        self.webView.load(myRequest)
    }
    
}

extension ViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        if navigationAction.targetFrame == nil {
//            let tempURL = navigationAction.request.url
//            var components = URLComponents()
//            components.scheme = tempURL?.scheme
//            components.host = tempURL?.host
//            components.path = (tempURL?.path)!
//
//            if components.url?.absoluteString == "http://117.52.170.157:8080/addr_ios" {
//                let webViewTemp = WKWebView(frame: self.view.bounds, configuration: configuration)
//                webViewTemp.uiDelegate = self
//                webViewTemp.navigationDelegate = self
//                self.view.addSubview(webViewTemp)
//                return webViewTemp
//            } else {
//                self.webView.load(navigationAction.request)
//            }
//        }
//        return nil
        
        let frame = UIScreen.main.bounds
        
        createWebView = WKWebView(frame: frame, configuration: configuration)
        
        createWebView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        createWebView?.navigationDelegate = self
        createWebView?.uiDelegate = self
        
        view.addSubview(createWebView!)
        
        return createWebView
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler(true)
        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in
            completionHandler(false)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: "", message: prompt, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = defaultText
        }
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            if let text = alertController.textFields?.first?.text {
                completionHandler(text)
            } else {
                completionHandler(defaultText)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in
            completionHandler(nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        // 중복적으로 리로드가 일어나지 않도록 처리 필요.
        webView.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    
}
