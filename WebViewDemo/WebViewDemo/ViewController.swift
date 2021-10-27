//
//  ViewController.swift
//  WebViewDemo
//
//  Created by gaobo on 2021/10/27.
//

import WebKit

class ViewController: UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        
        //创建WebView
        let webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        //创建网址
        let url = URL(string: "http://www.baidu.com")
        //创建请求
        let request = URLRequest(url: url!)
        //加载请求
        webView.load(request)
        //添加WebView到当前页面
        self.view.addSubview(webView)//将网页视图对象添加到当前视图控制器的根视图
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
