//
//  ViewController.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import UIKit
import WebKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        let vc = UIHostingController(rootView: ContentView())
        addChild(vc)
        vc.view.frame = self.view.frame;
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        */
        
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
        self.view.addSubview(webView)//将网页视图对象
        

        print("lucky")
    }

}

