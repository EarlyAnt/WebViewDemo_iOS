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
        
        Button(action: {
            //Todo: Add code for lauching unity here
            
            Unity.shared.show()
        }) {
            Text("Lauch Unity!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
