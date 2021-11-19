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
    var nativeDelegate : NativeDelegate?
    var navigationBar:UINavigationBar!
    
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
        //let url = URL(string: "http://www.baidu.com")
        let url = URL(string: "https://baike.baidu.com/item/%E5%A4%96%E6%BB%A9/40416")
        //创建请求
        let request = URLRequest(url: url!)
        //加载请求
        webView.load(request)
        //添加WebView到当前页面
        self.view.addSubview(webView)//将网页视图对象
        
        //实例化当行条
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.bounds.width, height: 44))
        //添加导航项
        navigationBar.pushItem(onMakeNavitem(), animated: true)
        self.view.addSubview(navigationBar)

        print("lucky")
    }

    func onMakeNavitem()->UINavigationItem{
        //创建导航项
        let navigationitem = UINavigationItem()
        let leftBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(leftButtonClick))
        //let rightBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(rightButtonClick))
        //navigationitem.title = "第1导航栏"
        navigationitem.setLeftBarButton(leftBtn, animated: true)
        //navigationitem.setRightBarButton(rightBtn, animated: true)
        return navigationitem
    }
    @objc func leftButtonClick(){
        print("previous")
        
        self.nativeDelegate?.closeWebPage()
    }
    /*
    @objc func rightButtonClick(){
        print("next")
    }
    */

}

