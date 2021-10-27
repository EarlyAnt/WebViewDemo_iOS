//
//  ViewController.swift
//  WebViewDemo
//
//  Created by gaobo on 2021/10/27.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 20, width: 360, height: 720)//创建一个现实区域
        let webView = UIWebView(frame: rect)//初始化网页视图对象，并设置其位置和尺寸
        */
        
        var screenBounds:CGRect = UIScreen.main.bounds;
        let webView = UIWebView(frame: screenBounds)//初始化网页视图对象，并设置其位置和尺寸
        
        let url = URL(string: "https://www.baidu.com")//创建一个网络地址对象
        let request = URLRequest(url: url!)//创建一个网址请求对象，作为网页视图对象的网络请求
        
        webView.loadRequest(request)//使用网页视图对象加载设置的网址
        self.view.addSubview(webView)//将网页视图对象添加到当前视图控制器的根视图
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
