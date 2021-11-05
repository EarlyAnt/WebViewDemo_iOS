//
//  Unity.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import Foundation
import UnityFramework
import UIKit

class Unity: UIResponder, UIApplicationDelegate {
    private struct UnityMessage {
        let objectName: String?
        let methodName: String?
        let messageBody: String?
    }
    private var cachedMessages = [UnityMessage]()
    
    static let shared = Unity()

    private let dataBundleId: String = "com.unity3d.framework"
    private let frameworkPath: String = "/Frameworks/UnityFramework.framework"
    
    private var ufw: UnityFramework?
    private var hostMainWindow: UIWindow?
    
    private var isInitialized: Bool {
        ufw?.appController() != nil
    }
    
    func show() {
        if isInitialized {
            showWindow()
        }
        else {
            initWindow()
        }
    }
    
    func setHostMainWindow(_ hostMainWindow: UIWindow) {
        self.hostMainWindow = hostMainWindow
    }
    
    private func initWindow() {
        if isInitialized {
            showWindow()
            return
        }
        
        guard let ufw = loadUnityFramework() else {
            print("Error: Was not able to load unity")
            return unloadWindow()
        }
        
        self.ufw = ufw
        ufw.setDataBundleId(dataBundleId)
        ufw.register(self)
        ufw.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: nil)
    }
    
    private func showWindow() {
        if isInitialized {
            ufw?.showUnityWindow()
        }
    }
    
    func unloadWindow() {
        if isInitialized {
            ufw?.unloadApplication()
        }
    }
    
    private func loadUnityFramework() -> UnityFramework? {
        let bundlePath: String = Bundle.main.bundlePath + frameworkPath
        
        let bundle = Bundle(path: bundlePath)
        if bundle?.isLoaded == false {
            bundle?.load()
        }
        
        let ufw = bundle?.principalClass?.getInstance()
        if ufw?.appController() == nil {
            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
            machineHeader.pointee = _mh_execute_header
            
            ufw?.setExecuteHeader(machineHeader)
        }
        return ufw
    }
    
    // Main method for sending a message to Unity
    func sendMessage(
        _ objectName: String,
        methodName: String,
        message: String
    ) {
        let msg: UnityMessage = UnityMessage(
            objectName: objectName,
            methodName: methodName,
            messageBody: message
        )

        // Send the message right away if Unity is initialized, else cache it
        if isInitialized {
            ufw?.sendMessageToGO(
                withName: msg.objectName,
                functionName: msg.methodName,
                message: msg.messageBody
            )
        } else {
            cachedMessages.append(msg)
        }
    }

    // Send all previously cached messages, if any
    private func sendCachedMessages() {
        if cachedMessages.count >= 0 && isInitialized {
            for msg in cachedMessages {
                ufw?.sendMessageToGO(
                    withName: msg.objectName,
                    functionName: msg.methodName,
                    message: msg.messageBody
                )
            }

            cachedMessages.removeAll()
        }
    }
}

extension Unity: UnityFrameworkListener {
    
    func unityDidUnload(_ notification: Notification) {
        ufw?.unregisterFrameworkListener(self)
        ufw = nil
        hostMainWindow?.makeKeyAndVisible()
    }
}
