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
    // questions data
    var questions: [Question]!
    var finalResult: Int = 0
    let animation = TimerAnimation()
    var time: Timer?
        
    var questionNumber: Int = 0 {
        didSet {
            remainingQuestion.text = "\(questionNumber)/\(maximun_question)"
        }
    }

    var seconds = 25 {
        didSet {
            timerLabel.text = "\(seconds)"
            animation.pulseAnimation(uilabel: timerLabel, active: false)
            
            if seconds > 0 && seconds < 10 {
                animation.pulseAnimation(uilabel: timerLabel, active: true)
                timerLabel.textColor = .red
            }            
        }
    }
    
    override func viewDidLoad() {
        answersTableView.dataSource = self
        answersTableView.delegate = self
        
        answersTableView.separatorStyle = .none
        answersTableView.showsVerticalScrollIndicator = false
        registerTableViewCells()
        
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        
        //remainingQuestion.text = "\(questionNumber)/\(maximun_question)"
        loadQuestionUI(question: questions[questionNumber])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        answersTableView.center.x -=  self.view.bounds.width
        answersTableView.alpha = 0
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
    
    func retry() {
        // Load all questions again        
        self.questions = QuestionData().loadQuestion()
        self.questionNumber = 0
        self.finalResult = 0
        self.viewDidLoad()
    }
    
    func goToMainScreen() {
        self.dismiss(animated: false)
    }
    
    func onAnswered() -> FinalResult {
        return (answered: finalResult, totalQuestion: maximun_question)
    }
}
