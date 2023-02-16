//
//  ProductionCalculator.swift
//  calculator
//
//  Created by Remy Borsboom on 16/02/2023.
//

import SwiftUI

struct CarreerPhaseView: View {
    
    struct Question: View {
        let text: String
        let answers: [String]
        @Binding var selectedAnswer: String?
        
        var body: some View {
            HStack {
                Text(text)
                Spacer()
                Menu {
                    ForEach(answers, id: \.self) { answer in
                        Button(answer) {
                            selectedAnswer = answer
                        }
                    }
                } label: {
                    Text(selectedAnswer ?? "Select Answer")
                        .frame(width: 150.0)
                }
            }
        }
    }
    
    @State private var selectedAnswer1: String?
    @State private var selectedAnswer2: String?
    @State private var selectedAnswer3: String?
    @State private var selectedAnswer4: String?
    @State private var selectedAnswer5: String?
    @State private var selectedAnswer6: String?
    @State private var selectedAnswer7: String?
    @State private var selectedAnswer8: String?
    @State private var selectedAnswer9: String?
    @State private var selectedAnswer10: String?
    @State private var selectedAnswer11: String?
    
    var body: some View {
        HStack(spacing: 0) {
            // First column
            VStack {
                // add more views as needed
                Form {
                    Section {
                        Question(text: "Question 1", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer1)
                        Question(text: "Question 2", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer2)
                        Question(text: "Question 3", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer3)
                        Question(text: "Question 4", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer4)
                        Question(text: "Question 5", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer5)
                        Question(text: "Question 6", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer6)
                        Question(text: "Question 7", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer7)
                        Question(text: "Question 8", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer8)
                        Question(text: "Question 9", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer9)
                        Question(text: "Question 10", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"], selectedAnswer: $selectedAnswer10)
                        
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
                    // Add any views to display the results
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






struct CarreerPhaseView_Previews: PreviewProvider {
    static var previews: some View {
        CarreerPhaseView()
            .frame(width: 600.0, height: 600.0)
    }
}




