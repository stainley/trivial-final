//
//  TimerAnimation.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/24/22.
//

import UIKit

class TimerAnimation: UIView {
    
    func pulseAnimation(uilabel: UILabel, active: Bool) {
        
        if active {
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.4
            pulse.fromValue = 1.0
            pulse.toValue = 1.12
            pulse.autoreverses = true
            pulse.initialVelocity = 0.5
            pulse.damping = 0.85
            uilabel.layer.add(pulse, forKey: nil)
        }
    }
}
