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
        Question(description: "What does it mean B.C", answers: [
            Answer(description: "Before Christ", correct: true),
            Answer(description: "After Christ", correct: false),
            Answer(description: "British Columbia", correct: false),
            Answer(description: "2nd and 3rd letter of ABC", correct: false),
        ]),
        Question(description: "Which day is celebrate New Year", answers: [
            Answer(description: "January 1", correct: false),
            Answer(description: "December 31", correct: true),
            Answer(description: "December 1", correct: false),
            Answer(description: "February 1", correct: false),
        ]),
        Question(description: "What is the capital of Canada", answers: [
            Answer(description: "Vancouver", correct: false),
            Answer(description: "Toronto", correct: false),
            Answer(description: "Quebec", correct: false),
            Answer(description: "Ottawa", correct: true),
        ]),
        Question(description: "Which month is celebrated Thanksgiving in Canada?", answers: [
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
