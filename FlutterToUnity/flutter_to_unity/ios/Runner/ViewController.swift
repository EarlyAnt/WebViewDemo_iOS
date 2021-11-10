//
//  ViewController.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let vc = UIHostingController(rootView: ContentView())
        addChild(vc)
        vc.view.frame = self.view.frame;
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        print("lucky")
    }

}

