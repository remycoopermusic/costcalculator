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
    
    struct QuizQuestion {
        let question: String
        let answers: [String]
        var selectedAnswer: String?
    }
    
    @State var quizQuestions: [QuizQuestion] = [
        QuizQuestion(question: "Question 1", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 2", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 3", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 4", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 5", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 6", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 7", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 8", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 9", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 10", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"]),
        QuizQuestion(question: "Question 11", answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5"])
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            // First column
            VStack {
                Form {
                    Section {
                        ForEach(quizQuestions.indices, id: \.self) { index in
                            Question(text: quizQuestions[index].question, answers: quizQuestions[index].answers, selectedAnswer: $quizQuestions[index].selectedAnswer)
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




