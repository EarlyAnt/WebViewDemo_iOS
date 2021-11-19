import Foundation

class ViewModel: NSObject, ObservableObject, NativeCallsProtocol {
    static var unityDelegate: UnityDelegate?
    
    override init() {
        super.init()

        NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
    }

    func sendMessage(toMobileApp message: String) {
        print(String(format: "ios received message from unity: %@", arguments:[message]))
        
        if message == "game_loaded" {
            ViewModel.unityDelegate?.initGame()
        }
        else if message == "exit_game" {
            Unity.shared.unloadWindow()
        }
        else if message == "open_webpage" {
            ViewModel.unityDelegate?.openWebPage()
        }
    }
}

protocol UnityDelegate {
    func initGame()
    func openWebPage()
}

protocol NativeDelegate {
    func closeWebPage()
}
