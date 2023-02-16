//
//  RateCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct LabeledTextField: View {
    let label: String
    @Binding var value: Int
    
    var body: some View {
        TextField(label, value: $value, formatter: NumberFormatter(), onCommit: {
            // Optional: add action to update your data when user presses return/enter
        })
    }
}

struct RateCalculator: View {
    @State private var work = 260
    @State private var sick = 5
    @State private var publicholidays = 6
    @State private var personalholidays = 25
    @State private var caredays = 6
    @State private var education = 4
    @State private var administration = 9
    @State private var development = 23
    @State private var acquisition = 23
    
    var totalHours: Int {
        work - sick - publicholidays - personalholidays - caredays - education - administration - development - acquisition
    }
    
    var subTotal: Int {
        sick + publicholidays + personalholidays + caredays + education + administration + development + acquisition
    }
    
    var body: some View {
        Form {
            Section(header: VStack(alignment: .leading) {
                Text("Hours")
                    .font(.title)
                    .fontWeight(.bold)
            }) {
                VStack() {
                    LabeledTextField(label: "Workdays", value: $work)
                    LabeledTextField(label: "Sick days", value: $sick)
                    LabeledTextField(label: "Public Holidays", value: $publicholidays)
                    LabeledTextField(label: "Personal Holidays", value: $personalholidays)
                    LabeledTextField(label: "Care days", value: $caredays)
                    LabeledTextField(label: "Education days", value: $education)
                    LabeledTextField(label: "Administration days", value: $administration)
                    LabeledTextField(label: "Personal development", value: $development)
                    LabeledTextField(label: "Acquisition", value: $acquisition)
                    Text("Subtotal: \(subTotal)\nbillable per year: \(totalHours)")
                        .frame(maxWidth: 200)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 400)

        
    }
}


struct RateCalculator_Previews: PreviewProvider {
    static var previews: some View {
        RateCalculator()
    }
}
