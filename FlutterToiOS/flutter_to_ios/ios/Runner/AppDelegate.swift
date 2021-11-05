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
              result(String(format: "%@->Hi flutter, I'm iOS", arguments: [self.getCurrentTime()]))
          }
          else {
              result("flutter method not implemented")
          }
      }
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        
        //dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss";
        dateFormatter.dateFormat = "HH:mm:ss";
        
        let time = dateFormatter.string(from: Date())
        return time;
    }
}
