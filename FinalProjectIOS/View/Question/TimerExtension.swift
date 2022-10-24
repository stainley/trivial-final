//
//  TimerExtension.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/23/22.
//

import UIKit

extension QuestionViewController {
        
    @objc func updateTimer() {
        seconds -= 1
        
        if seconds == 0 {
            questionNumber += 1
            nextQuestion()
        }    
    }
}
