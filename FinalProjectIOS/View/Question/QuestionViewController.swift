//
//  QuestionViewController.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/22/22.
//

import UIKit

class QuestionViewController: UIViewController {
        
    @IBOutlet weak var remainingQuestion: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    let maximun_question = 3
    var currentQuestion: Question!
    var questions: [Question]!
    
    var questionNumber: Int = 0 {
        didSet {
            remainingQuestion.text = "\(questionNumber)/\(maximun_question)"
        }
    }
    var finalResult: Int = 0
    
    var time: Timer?
    var seconds = 25 {
        didSet {
            timerLabel.text = "\(seconds)"
            
            if seconds > 0 && seconds < 10 {
                timerLabel.textColor = .red
            }
        }
    }
    
    override func viewDidLoad() {
        remainingQuestion.text = "\(questionNumber)/\(maximun_question)"
        answersTableView.dataSource = self
        answersTableView.delegate = self
        
        answersTableView.separatorStyle = .none
        answersTableView.showsVerticalScrollIndicator = false
  
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)

        loadQuestionUI(question: questions[questionNumber])
      
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        let contentCell = UINib(nibName: "QuestionCustomTableViewCell", bundle: nil)
        self.answersTableView.register(contentCell, forCellReuseIdentifier: "QuestionCustomTableViewCell")
    }
    
    func loadQuestionUI(question: Question) {
        seconds = 25
        timerLabel.textColor = .black
        questionLabel.text = question.description
        currentQuestion = question

        answersTableView.reloadData()
    }
    
    func checkAnswer(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: {$0.description == answer.description}) && answer.correct
    }
    
    func questionViewToDismiss() {
        self.dismiss(animated: false)
    }
    
    func onAnswered() -> (answered: Int, totalQuestion: Int) {
        
        return (answered: finalResult, totalQuestion: maximun_question)
    }
}
