//
//  ContentView.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import SwiftUI

struct ContentView: View {
    static var nativeDelegate : NativeDelegate?
    
    //let viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                
                /*
                _ = ViewModel()
                Unity.shared.show()
                Unity.shared.sendMessage("Canvas", methodName: "SetBallColor", message: "green")
                */
                
                ContentView.nativeDelegate?.closeWebPage()
            }) {
                Text("Close View")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
