//
//  AnswerTableViewExtension.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/23/22.
//

import UIKit
/**
 Table datasource extension
 */
extension QuestionViewController: UITableViewDataSource, PopUpModalDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let optionsCell = tableView.dequeueReusableCell(withIdentifier: "QuestionCustomTableViewCell", for: indexPath) as! QuestionCustomTableViewCell
        optionsCell.selectionStyle = .none       
        optionsCell.questionCellLabel.text = currentQuestion.answers[indexPath.row].description
        
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
            self.answersTableView.alpha = 1
            optionsCell.center.x += self.view.bounds.width
            optionsCell.clipsToBounds = true
        })
        
        return optionsCell
    }
    
    /**
     * Call for the next question and update the UI
     */
    func nextQuestion()  {
        if questionNumber < maximun_question {
            let nextQuestion = questions[questionNumber]
            loadQuestionUI(question: nextQuestion)
        } else {
            time?.invalidate()
            time = nil
            
            // present a modal with result information
            let view =  ResultModalViewController()
            view.delegate = self
            view.modalPresentationStyle = .overFullScreen
            view.modalTransitionStyle = .coverVertical
            self.present(view, animated: true)
            
            return
        }
    }
}


/**
 Table delegate extension
 **/
extension QuestionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {        
        
        if let question = currentQuestion {
            let answer = question.answers[indexPath.row]
          
            if checkAnswer(answer: answer, question: question) {
                // correct
                finalResult += 1
                questionNumber += 1
            } else {
                // wrong
                questionNumber += 1
            }
            nextQuestion()
        }
        return indexPath
    }
}
