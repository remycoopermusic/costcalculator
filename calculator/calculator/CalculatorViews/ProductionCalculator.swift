//
//  ProductionCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct ProductionCalculator: View {
    @State private var hourlyRate = ""
    @State private var percentDiscount = ""
    @State private var hours = 1.0
    @State private var masterPercentageShare = 0.0
    
    var body: some View {
        HStack(spacing: 0) {
            // First column
            VStack {
                // add more views as needed
                Form {
                    Section {
                        TextField("Hourly Rate", text: $hourlyRate)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        HStack {
                            Text("Hours")
                            Slider(value: $hours, in: 1...100, step: 1)
                            Text("\(Int(hours))")
                                .frame(width: 40) // Fixed width label
                        }

                        HStack {
                            Text("Master Percentage Share")
                            Slider(value: $masterPercentageShare, in: 0...100, step: 5)
                            Text("\(Int(masterPercentageShare))")
                                .frame(width: 40) // Fixed width label
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding()

            // Second column
            VStack {
                Text("Summary goes here")
                    .padding()

                VStack {
                    HStack {
                        Text("Total Price:")
                        Spacer()
                        Text("$999.99")
                    }
                    .padding()

                    HStack {
                        Text("Total Discount:")
                        Spacer()
                        Text("$99.99")
                    }
                    .padding()
                }
                .padding()
            }
            .frame(width: 250)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
            )
        }
    }
}




struct ProductionCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ProductionCalculator()
    }
}




