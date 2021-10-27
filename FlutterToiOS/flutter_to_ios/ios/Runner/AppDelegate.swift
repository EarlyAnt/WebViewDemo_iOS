import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller = self.window.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel.init(name: "com.pages.flutter", binaryMessenger: controller as! FlutterBinaryMessenger)
      channel.setMethodCallHandler{(call, result) in
          if call.method == "callNativeMethod" {
              let para = call.arguments
              print(para!)
              result("Hi flutter, I'm iOS")//通过callback返回调用结果
              //channel.invokeMethod("callFlutterMethod", arguments: "Hi flutter, I'm iOS 2")//通过主动调用flutter的方法返回消息
          }
          else {
              result("flutter method not implemented")
          }
      }
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
