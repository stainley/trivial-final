//
//  ResultModalViewController.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/23/22.
//

import UIKit

typealias ResultTuple = (answered: Int, totalQuestion: Int)

class ResultModalViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var finalResultLabel: UILabel!
    
    public weak var delegate: (any PopUpModalDelegate)?
    
    var result: ResultTuple! {
        didSet {
            finalResultLabel.text = "\(result!.answered) of \(result!.totalQuestion)"
        }
    }
    
    @IBAction func retryAgain(_ sender: UIButton) {
        self.dismiss(animated: false)
        delegate?.questionViewToDismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.55)
        
        guard let onCallbackAnswer = delegate?.onAnswered() else {
            return
        }
        
        result = onCallbackAnswer
        resultImage.image = UIImage(named: resultMessage(value: result.answered).rawValue)
    }
    
    
    private func resultMessage(value answered: Int) -> Message {
        
        switch answered {
            case 1:
                return .GOOD_JOB
            case 2:
                return .VERY_GOOD
            case 3:
                return .EXCELLENT_WORK
            default:
                return .TRY_AGAIN
        }
    }
}

enum Message: String {
    case GOOD_JOB = "Good Job"
    case VERY_GOOD = "Great Job"
    case EXCELLENT_WORK = "Excellent Job"
    case TRY_AGAIN = "Try Again"
}

public protocol PopUpModalDelegate: AnyObject {
      
    func questionViewToDismiss()
    func onAnswered() -> (answered: Int, totalQuestion: Int)
}
