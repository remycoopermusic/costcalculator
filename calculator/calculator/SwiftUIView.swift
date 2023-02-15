//
//  SwiftUIView.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var selectedTab = 0

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                VStack {
                    VStack(spacing: 0) {
                        Button(action: {
                            selectedTab = 0
                        }, label: {
                            HStack {
                                Image(systemName: "house")
                                Text("Calculator")
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.white)
                            .background(selectedTab == 0 ? Color.blue : Color.gray)
                        })

                        Divider()

                        Button(action: {
                            selectedTab = 1
                        }, label: {
                            HStack {
                                Image(systemName: "person")
                                Text("Account")
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.white)
                            .background(selectedTab == 1 ? Color.blue : Color.gray)
                        })
                    }
                    .frame(width: 200)
                    .background(Color(red: 32/255, green: 33/255, blue: 35/255))
                    
                    Spacer()
                }
                .background(Color(red: 32/255, green: 33/255, blue: 35/255))

                if selectedTab == 0 {
                    CostCalculatorView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(red: 54/255, green: 55/255, blue: 64/255))
                } else if selectedTab == 1 {
                    Text("Add Account info here")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(red: 54/255, green: 55/255, blue: 64/255))
                }
            }
            .frame(minWidth: 600, minHeight: 400)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
