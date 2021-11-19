import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, UnityDelegate, NativeDelegate {
    var flutterViewController : FlutterViewController?
    
    func initGame() {
        Unity.shared.sendMessage("Canvas", methodName: "SetBallColor", message: "green")
        Unity.shared.sendMessage("Canvas", methodName: "ReceiveMessage", message: "Lucky")
    }
    
    func closeWebPage() {
        /*
        let navigationController = UINavigationController(rootViewController: flutterViewController!)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        */
        
        Unity.shared.show()
        flutterViewController?.dismiss(animated: true, completion: nil)
    }
    
    func openWebPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webPage = storyboard.instantiateViewController(withIdentifier: "thirdVC") as! ViewController
        webPage.nativeDelegate = self
        flutterViewController?.present(webPage, animated: true, completion: (() -> Void)? {
            Unity.shared.hideWindow()
            self.window.makeKeyAndVisible()
        })
        
        /*
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        */
    }
    
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      ViewModel.unityDelegate = self
      
      let controller = self.window.rootViewController as! FlutterViewController
      flutterViewController = controller
      
      let channel = FlutterMethodChannel.init(name: "com.pages.flutter", binaryMessenger: controller as! FlutterBinaryMessenger)
      channel.setMethodCallHandler{(call, result) in
          if call.method == "run_unity" {
              let para = call.arguments as? String
              print(String(format: "ios receive message: %@", arguments: [para!]))
              
              _ = ViewModel()
              Unity.shared.setHostMainWindow(self.window!)
              Unity.shared.show()
              //Unity.shared.sendMessage("Canvas", methodName: "SetBallColor", message: "green")
              //Unity.shared.sendMessage("Canvas", methodName: "ReceiveMessage", message: "Lucky")
              
              result(String(format: "%@->run unity success", arguments: [self.getCurrentTime()]))
          }
          if call.method == "run_webview" {
              let para = call.arguments as? String
              print(String(format: "ios receive message: %@", arguments: [para!]))
              
              self.openWebPage()
              
              result(String(format: "%@->open web page success", arguments: [self.getCurrentTime()]))
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
