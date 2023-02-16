//
//  ProductionCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct ProductionCalculator: View {
    
    enum VAT: String, CaseIterable, Identifiable {
        case zero = "0%"
        case nine = "9%"
        case twentyOne = "21%"
        
        var id: String { self.rawValue }
    }
    
    @State private var hourlyRate: String = "58"
    @State private var percentDiscount: String = ""
    @State private var hours: Double = 1
    @State private var masterPercentageShare: Double = 0
    @State private var selectedVAT: VAT = .zero
    
    var priceExcludingVAT: Double {
        let hourlyRate = Double(self.hourlyRate) ?? 0
        return ((hourlyRate * hours) - (16.24 * (masterPercentageShare*0.01)))
    }
    
    var totalDiscount: Double {
        let hourlyRate = Double(self.hourlyRate) ?? 0
        return ((hourlyRate * hours) - priceExcludingVAT) * hours
    }
    
    var vatPrice: Double {
        return priceExcludingVAT * (Double(selectedVAT.rawValue.dropLast())! / 100)
    }
    
    var priceIncludingVAT: Double {
        let vatMultiplier = 1 + Double(selectedVAT.rawValue.dropLast())! / 100
        return priceExcludingVAT * vatMultiplier
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
                            Text("VAT")
                            Menu {
                                ForEach(VAT.allCases) { option in
                                    Button(option.rawValue) {
                                        self.selectedVAT = option
                                    }
                                }
                            } label: {
                                Text(selectedVAT.rawValue)
                            }
                        }
                    }
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity)
            .padding()

            // Second column
            VStack {
                Text("Results")
                    .font(.title)
                    .padding()
                    
                    

                VStack {
                    HStack {
                        Text("Price Excl. VAT:")
                        Spacer()
                        Text("$\(String(format: "%.2f", priceExcludingVAT))")
                    }
                    .padding()

                    HStack {
                        Text("VAT Price:")
                        Spacer()
                        Text("$\(String(format: "%.2f", vatPrice))")
                    }
                    .padding()
                    
                    HStack {
                        Text("Total Discount:")
                        Spacer()
                        Text("$\(String(format: "%.2f", totalDiscount))")
                    }
                    .padding()

                    HStack {
                        Text("Price Incl. VAT:")
                        Spacer()
                        Text("$\(String(format: "%.2f", priceIncludingVAT))")
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
        .padding()
    }
}



struct ProductionCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ProductionCalculator()
            .frame(width: 600.0, height: 600.0)
    }
}




