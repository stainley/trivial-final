//
//  Question.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/22/22.
//

import Foundation

struct Question {
    var description: String
    var answers: [Answer]
}

struct Answer {
    
    var description: String
    var correct: Bool
}
