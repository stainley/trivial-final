//
//  QuestionData.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/22/22.
//

import Foundation

class QuestionData {
    
    var randomListQuestion = [Question]()
    
    let listQuestion: [Question] = [
        Question(description: "Canada has ______ provinces", answers: [
            Answer(description: "8", correct: false),
            Answer(description: "10", correct: true),
            Answer(description: "15", correct: false),
            Answer(description: "12", correct: false),
        ]),
        Question(description: "The largest city in Canada is", answers: [
            Answer(description: "Montreal", correct: false),
            Answer(description: "Toronto", correct: true),
            Answer(description: "Edmonton", correct: false),
            Answer(description: "Vancouver", correct: false),
        ]),
        Question(description: "What is the capital of Canada", answers: [
            Answer(description: "Vancouver", correct: false),
            Answer(description: "Toronto", correct: false),
            Answer(description: "Montreal", correct: false),
            Answer(description: "Ottawa", correct: true),
        ]),
        Question(description: "What did Dominion Day mean?", answers: [
            Answer(description: "Independence Day", correct: false),
            Answer(description: "Indigenous Day ", correct: false),
            Answer(description: "Canada Day", correct: true),
            Answer(description: "Truth and Reconciliation", correct: false),
        ]),
        Question(description: "The most predominant religion in Canada", answers: [
            Answer(description: "Islam", correct: false),
            Answer(description: "Hinduism", correct: false),
            Answer(description: "Christians", correct: true),
            Answer(description: "No religion", correct: false),
        ]),
        Question(description: "Thanksgiving month in Canada", answers: [
            Answer(description: "November", correct: false),
            Answer(description: "December", correct: false),
            Answer(description: "October", correct: true),
            Answer(description: "September", correct: false),
        ])
    ]
    
    func loadQuestion() -> [Question] {
        
        for (index, question) in listQuestion.enumerated() {
            var innerQuestion = question
            // removed possible answers to be added randomly
            innerQuestion.answers = []
            randomListQuestion.append(innerQuestion)
            
            // Shufflet order of possible answers
            for (_, answer) in question.answers.enumerated().shuffled() {
                randomListQuestion[index].answers.append(answer)
            }
        }
        
        return randomListQuestion.shuffled()
    }
}
