//
//  ContentView.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
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
