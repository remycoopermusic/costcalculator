//
//  ContentView.swift
//  Shared
//
//  Created by Remy Borsboom on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "bolt.fill").imageScale(.large).foregroundColor(.accentColor)
            Text("Hello, world!")
        
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
