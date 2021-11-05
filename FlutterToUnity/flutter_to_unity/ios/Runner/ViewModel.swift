import Foundation

class ViewModel: NSObject, ObservableObject, NativeCallsProtocol {

    override init() {
        super.init()

        NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
    }

    func sendMessage(toMobileApp message: String) {
        print(String(format: "ios received message from unity: %@", arguments:[message]))
        
        Unity.shared.unloadWindow()
    }
}
