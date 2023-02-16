//
//  Settings.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI


struct SettingsView: View {
   var body: some View {
       // 1
       TabView {
         // 2
         Text("Tab 1 content here")
           // 3
           .tabItem {
             Image(systemName: "person.fill")
             Text("Show")
           }

         // 4
         Text("Tab 2 content here")
           .tabItem {
             Image(systemName: "sun.min")
             Text("Appearance")
           }
       }
       
       
   }
   }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
