//
//  CellCustomHelper.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/23/22.
//
import UIKit

@IBDesignable class CellCustomHelper: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
   @IBInspectable var borderWidth: CGFloat = 0 {
       didSet {
           layer.borderWidth = borderWidth
       }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 1 {
        didSet {
            layer.shadowRadius = shadowRadius
            layer.shadowOffset = CGSize(width: 25, height: 16)
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var maskToBound: Bool = false {
        didSet {
            layer.masksToBounds = maskToBound
        }
    }
    
}
