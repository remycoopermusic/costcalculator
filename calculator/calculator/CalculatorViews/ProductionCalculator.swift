//
//  ProductionCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct ProductionCalculator: View {
    
    @State private var hourlyRate: String = ""
    @State private var percentDiscount: String = ""
    @State private var hours: Double = 1
    @State private var masterPercentageShare: Double = 1
    
    var masterDiscount: Double { 1 }
    var totalPrice: Double {
        (Double(hourlyRate) ?? 0) * hours - totalDiscount
    }
    var totalDiscount: Double {
        masterDiscount * (masterDiscount - masterPercentageShare)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            // First column
            VStack {
                // Text("Form goes here")
                // add more views as needed
                Form {
                    Section {
                        TextField("Hourly Rate", text: $hourlyRate)
                                                    
                        HStack {
                            Text("Hours")
                            Slider(value: $hours, in: 1...100, step: 1)
                            Text("\(hours, specifier: "%.0f")")
                                .frame(width: 40) // Fixed width label
                        }

                        HStack {
                            Text("Master Percentage Share")
                            Slider(value: $masterPercentageShare, in: 0...100, step: 5)
                            Text("\(masterPercentageShare, specifier: "%.0f")")
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
                        Text("$\(String(format: "%.2f", totalPrice))")
                    }
                    .padding()

                    HStack {
                        Text("Total Discount:")
                        Spacer()
                        Text("$\(String(format: "%.2f", totalDiscount))")
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




