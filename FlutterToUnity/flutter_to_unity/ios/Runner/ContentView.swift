//
//  ContentView.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import SwiftUI

struct ContentView: View {
    
    //let viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                Unity.shared.show()
            }) {
                Text("Launch Unity")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
