//
//  ContentView.swift
//  SimpleSidebarUI
//
//  Created by Justin Bush on 2021-03-03.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ListView()
            
            MainView()
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ListView: View {
    var body: some View {
        Text("List")
    }
}

struct MainView: View {
    var body: some View {
        Text("List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
