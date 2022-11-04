//
//  ViewController.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/22/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func playQuiz(_ sender: UIButton) {
        let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "questionID") as? QuestionViewController
        
        guard let questionView = questionViewController else {
            return
        }
        questionView.modalPresentationStyle = .fullScreen
        questionView.questions = startQuiz()
        
        self.show(questionView, sender: self)
    }
        
    func startQuiz() -> [Question] {
        let quizData = QuestionData()
        
        return quizData.loadQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

