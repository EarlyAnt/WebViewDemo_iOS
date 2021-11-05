//
//  UnityUtil.swift
//  Runner
//
//  Created by gaobo on 2021/11/5.
//

import Foundation

//@objcMembers
class UnityUtil : NSObject {
    @objc
    func unloadWindow() {
        Unity.shared.unloadWindow()
        print("<><UnityUtil.unloadWindow>ok ok ok")
    }
}
