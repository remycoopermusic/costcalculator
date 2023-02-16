//
//  Application.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct Application: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: About()) {
                    Label("Welcome", systemImage: "star")
                }
                
                Spacer()
                
                Text("CALCULATORS")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                Group{
                    NavigationLink(destination: HourlyRateCalculatorView()) {
                        Label("Hourly Rate", systemImage: "house")
                    }
                    NavigationLink(destination: WebsitesCalculatorView()) {
                        Label("Production Calc", systemImage: "globe")
                    }
                    NavigationLink(destination: DomainsCalculatorView()) {
                        Label("Domains", systemImage: "link")
                    }
                    NavigationLink(destination: TemplatesCalculatorView()) {
                        Label("Templates", systemImage: "rectangle.stack")
                    }
                }
                
                Spacer()
                
                Text("PROFILE")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                Group {
                    NavigationLink(destination: ContentView()) {
                        Label("My Account", systemImage: "person")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Notifications", systemImage: "bell")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Settings", systemImage: "gear")
                    }
                }
                
                Spacer()
                
                Divider()
                NavigationLink(destination: ContentView()) {
                    Label("Sign Out", systemImage: "arrow.backward")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Explore")
            .frame(minWidth: 150, idealWidth: 250, maxWidth: 300)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            }
            
            ContentView()
        }
    }
}

// Toggle Sidebar Function
func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
