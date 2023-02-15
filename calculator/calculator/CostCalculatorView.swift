//
//  CostCalculatorView.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct CostCalculatorView: View {
    @State private var productPrice = 0.0
    @State private var quantity = 1
    @State private var discount = 0.0
    @State private var taxRate = 0.0

    var body: some View {
        Form {
            Section(header: Text("Product Details")) {
                HStack {
                    Text("Product Price:")
                    Spacer()
                    TextField("0.0", value: $productPrice, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Quantity:")
                    Spacer()
                    Stepper(value: $quantity, in: 1...100) {
                        Text("\(quantity)")
                    }
                }
                HStack {
                    Text("Discount:")
                    Spacer()
                    TextField("0.0", value: $discount, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
            }

            Section(header: Text("Tax")) {
                HStack {
                    Text("Tax Rate:")
                    Spacer()
                    Slider(value: $taxRate, in: 0.0...0.5, step: 0.01)
                }
            }

            Section(header: Text("Total Cost")) {
                Text("$\(totalCost, specifier: "%.2f")")
            }
        }
        .padding(.horizontal, 100.0)
        .frame(width: 400.0)
    }

    var totalCost: Double {
        let subTotal = productPrice * Double(quantity)
        let discountedSubTotal = subTotal - (subTotal * discount)
        let tax = discountedSubTotal * taxRate
        return discountedSubTotal + tax
    }
}

struct CostCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CostCalculatorView()
            .frame(width: 400.0, height: 400.0)
    }
}
