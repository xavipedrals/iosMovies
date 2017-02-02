//
//  CustomSegment.swift
//  MoviesApp
//
//  Created by jedi17 on 2/2/17.
//  Copyright © 2017 jedi. All rights reserved.
//
import UIKit

@IBDesignable
class CustomSegment: UISegmentedControl {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}
