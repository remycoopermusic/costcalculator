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
        let answers: [Answer]
        @Binding var selectedAnswer: Answer?
        let variables: [Int] = [
            7, // Question 1
            5, // Question 2
            9, // Question 3
            7, // Question 4
            10, // Question 5
            8, // Question 6
            12, // Question 7
            8, // Question 8
            7, // Question 9
            15, // Question 10
            12, // Question 11
        ]
        
        var body: some View {
                    HStack {
                        Text(text)
                        Spacer()
                        Menu {
                            ForEach(answers, id: \.self) { answer in
                                Button(answer.text) {
                                    selectedAnswer = answer
                                }
                            }
                        } label: {
                            Text(selectedAnswer?.text ?? "Select Answer")
                                .frame(width: 150.0)
                        }
                    }
                }
            }
            
            struct QuizQuestion {
                let question: String
                let answers: [Answer]
                var selectedAnswer: Answer?
            }
            
            struct Answer: Hashable {
                let id = UUID()
                let text: String
                var variable: Int
            }
    
    @State var quizQuestions: [QuizQuestion] = [
            QuizQuestion(question: "Hoe lang ben je al bezig onder deze naam?", answers: [
                Answer(text: "0 tot 6 maanden", variable: 1),
                Answer(text: "6 maanden tot 2 jaar", variable: 2),
                Answer(text: "2 tot 5 jaar", variable: 4),
                Answer(text: "5 tot 10 jaar", variable: 8),
                Answer(text: "Meer dan 10 jaar", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel tracks heb je gereleased? ", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel shows op (VNPF) poppodia en festivals heb je met deze act gedaan in de afgelopen 4 jaar?", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel shows op overige podia heb je met deze act gedaan in de afgelopen 4 jaar?", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel monthly listeners heeft deze act op Spotify? ", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel streams heeft deze act in totaal (sinds het jaar dat de act bestaat)?", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel airplay op landelijke radio heeft deze act de afgelopen twee jaar gehad?", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel landelijke media aandacht heeft deze act de afgelopen twee jaar gehad? Het gaat hierbij om het aantal recensies, artikelen, spreads en live-optredens op tv of radio.", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel volgers in totaal heeft deze act op social media?", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel professionele erkenning heeft deze act tot nu toe gekregen? Het gaat hierbij om nominaties, prijzen en selecties", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
            ]),
            QuizQuestion(question: "Hoeveel shows in het buitenland heeft deze act in de afgelopen 4 jaar gedaan?", answers: [
                Answer(text: "Answer 1", variable: 1),
                Answer(text: "Answer 2", variable: 2),
                Answer(text: "Answer 3", variable: 4),
                Answer(text: "Answer 4", variable: 8),
                Answer(text: "Answer 5", variable: 16),
    ])]
    
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
                    let total = quizQuestions.reduce(0) { (partialResult, quizQuestion) -> Int in
                        let answerVariable = quizQuestion.selectedAnswer?.variable ?? 0
                        return partialResult + answerVariable
                    }
                    Text("Total: \(total)")
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




