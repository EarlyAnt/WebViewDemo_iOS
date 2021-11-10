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
        let url = URL(string: "http://www.baidu.com")
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
        /*
        count = count + 1
        //更新内容
        navigationBar.pushItem(onMakeNavitem(), animated: true)
         */
        print("previous")
        
        self.dismiss(animated: true, completion: nil)
        Unity.shared.show()
    }
    /*
    @objc func rightButtonClick(){
        /*
        if count > 1{
            count -= 1
            //返回上一层
            navigationBar.popItem(animated: true)
        }
        */
        print("next")
    }
    */

}

