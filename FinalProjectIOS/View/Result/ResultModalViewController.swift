//
//  ResultModalViewController.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/23/22.
//

import UIKit

public typealias FinalResult = (answered: Int, totalQuestion: Int)

class ResultModalViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var finalResultLabel: UILabel!
    
    var animation: TimerAnimation = TimerAnimation()
    
    public weak var delegate: (any PopUpModalDelegate)?
    
    var result: FinalResult! {
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
        self.transitioningDelegate = self
    
    }
   
    override func viewWillAppear(_ animated: Bool) {
        finalResultLabel.alpha = 0
        resultImage.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.finalResultLabel.alpha = 1
            self.resultImage.alpha = 1
            self.finalResultLabel.font.withSize(1)
            
        })
        
        UIView.animate(withDuration: 0.25, delay: 0.20, animations: {
            self.finalResultLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.resultImage.layer.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 220, height: 220))
            self.resultImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        })
        
        UIView.animate(withDuration: 0.75, delay: 0.25, animations: {
            self.finalResultLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                        
            self.resultImage.layer.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 120, height: 120))
            self.resultImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        })
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
    
    enum Message: String {
        case GOOD_JOB = "Good Job"
        case VERY_GOOD = "Great Job"
        case EXCELLENT_WORK = "Excellent Job"
        case TRY_AGAIN = "Try Again"
    }
}

public protocol PopUpModalDelegate: AnyObject {
      
    func questionViewToDismiss()
    func onAnswered() -> FinalResult
}

extension ResultModalViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ResultAnimationController(animationDuration: 0.95, animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ResultAnimationController(animationDuration: 3, animationType: .dismiss)
    }
}
