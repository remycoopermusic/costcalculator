//
//  RateCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct RateCalculator: View {
    @State private var workdays = 260
    @State private var sickdays = 5
    @State private var holidays = 25
    
    var totalHours: Int {
        workdays - sickdays - holidays
    }
    
    var body: some View {
        Form {
            Section(header: VStack(alignment: .leading) {
                Text("Hours")
                    .font(.title)
                    .fontWeight(.bold)
            }) {
                VStack() {
                    TextField("Workdays", value: $workdays, formatter: NumberFormatter(), onCommit: {
                        // Optional: add action to update your data when user presses return/enter
                    })
                    TextField("Sick days", value: $sickdays, formatter: NumberFormatter(), onCommit: {
                        // Optional: add action to update your data when user presses return/enter
                    })
                    TextField("Holidays", value: $holidays, formatter: NumberFormatter(), onCommit: {
                        // Optional: add action to update your data when user presses return/enter
                    })
                    Text("Total hours: \(totalHours)")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 120)
            }
            Spacer()
        }
        .frame(maxWidth: 400)
        
    }
}

struct RateCalculator_Previews: PreviewProvider {
    static var previews: some View {
        RateCalculator()
    }
}
