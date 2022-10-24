//
//  CardViewHelper.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/22/22.
//

import UIKit

@IBDesignable
class CardViewHelper: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable
    var shadowActive: Bool = false {
        didSet {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
            layer.borderColor = UIColor.white.cgColor           
            layer.shadowOffset = CGSize(width: 6.0, height: 12.0)
            clipsToBounds = false
            layer.shadowOpacity = 0.6
            layer.shadowRadius = 8
        }
    }
    
    @IBInspectable
    var shadowColor: CGColor = UIColor.lightGray.cgColor {
        
        didSet {
            layer.shadowColor = shadowColor
        }
    }
}
