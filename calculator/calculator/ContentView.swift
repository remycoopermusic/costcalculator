//
//  ContentView.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct About: View {
    var body: some View {
        VStack {
            Text("About")
                .font(.largeTitle)
            Text("This is where the Hourly Rate Calculator would be displayed.")
                .font(.title2)
            Spacer()
        }
        .padding()
    }
}

struct HourlyRateCalculatorView: View {
    var body: some View {
        VStack {
            Text("Hourly Rate Calculator")
                .font(.largeTitle)
            Text("This is where the Hourly Rate Calculator would be displayed.")
                .font(.title2)
            RateCalculator()
        }
        .padding()
        Spacer()
    }
}

struct WebsitesCalculatorView: View {
    var body: some View {
        VStack {
            Text("Websites Calculator")
                .font(.largeTitle)
            Text("This is where the Websites Calculator would be displayed.")
                .font(.title2)
            ProductionCalculator()
            Spacer()
        }
        .padding()
    }
}

struct DomainsCalculatorView: View {
    var body: some View {
        VStack {
            Text("Domains Calculator")
                .font(.largeTitle)
            Spacer()
            Text("This is where the Domains Calculator would be displayed.")
                .font(.title2)
        }
        .padding()
    }
}

struct TemplatesCalculatorView: View {
    var body: some View {
        VStack {
            Text("Templates Calculator")
                .font(.largeTitle)
            Spacer()
            Text("This is where the Templates Calculator would be displayed.")
                .font(.title2)
        }
        .padding()
    }
}
