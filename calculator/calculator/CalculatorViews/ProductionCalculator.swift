//
//  ProductionCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct ProductionCalculator: View {
    
    let vatRates = [0, 9, 21]
    
    @State private var hourlyRate: String = ""
    @State private var percentDiscount: String = ""
    @State private var hours: Double = 1
    @State private var masterPercentageShare: Double = 0
    @State private var selectedVatRateIndex = 0
    
    var totalPrice: Double {
        let hourlyRate = Double(self.hourlyRate) ?? 0
        let vatRate = Double(vatRates[selectedVatRateIndex]) / 100.0 + 1.0
        return ((hourlyRate * hours) - (16.24 * (masterPercentageShare * 0.1))) * vatRate
    }
    
    var totalDiscount: Double {
        let hourlyRate = Double(self.hourlyRate) ?? 0
        let vatRate = Double(vatRates[selectedVatRateIndex]) / 100.0 + 1.0
        let totalDiscount = (hourlyRate * hours) - totalPrice / vatRate
        return totalDiscount
    }
    
    var body: some View {
        HStack(spacing: 0) {
            // First column
            VStack {
                // Text("Form goes here")
                // add more views as needed
                Form {
                    Section {
                        HStack {
                            Spacer()
                            TextField("Hourly Rate", text: $hourlyRate)
                        }
                        
                        HStack {
                            Text("Hours")
                            Slider(value: $hours, in: 1...50, step: 1)
                            Text("\(hours, specifier: "%.0f")")
                                .frame(width: 40) // Fixed width label
                        }

                        HStack {
                            Text("Master Percentage Share")
                            Slider(value: $masterPercentageShare, in: 0...50, step: 5)
                            Text("\(masterPercentageShare, specifier: "%.0f")")
                                .frame(width: 40) // Fixed width label
                        }
                        
                        HStack {
                            Picker("VAT", selection: $selectedVatRateIndex) {
                                ForEach(0..<vatRates.count) { index in
                                    Text("\(vatRates[index])%")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
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
                        Text("Price Excluding VAT:")
                        Spacer()
                        Text("$\(String(format: "%.2f", totalPrice / (Double(vatRates[selectedVatRateIndex]) / 100.0 + 1.0)))")
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




