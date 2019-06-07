//
//  TextStylable.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 07/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

protocol TextStylable {
    
    func applyTextFont(_ font: UIFont)
    func applyTextColor(_ color: UIColor, for state: UIControl.State)
    func applyTextAlignment(_ alignment: NSTextAlignment)
    
}

extension UILabel: TextStylable {
    
    func applyTextFont(_ font: UIFont) {
        self.font = font
    }
    
    func applyTextColor(_ color: UIColor, for state: UIControl.State) {
        textColor = color
    }
    
    func applyTextAlignment(_ alignment: NSTextAlignment) {
        textAlignment = alignment
    }
    
}

extension UITextField: TextStylable {
    
    func applyTextFont(_ font: UIFont) {
        self.font = font
    }
    
    func applyTextColor(_ color: UIColor, for state: UIControl.State) {
        textColor = color
    }
    
    func applyTextAlignment(_ alignment: NSTextAlignment) {
        textAlignment = alignment
    }
    
}

extension UIButton: TextStylable {
    
    func applyTextFont(_ font: UIFont) {
        titleLabel?.font = font
    }
    
    func applyTextColor(_ color: UIColor, for state: UIControl.State) {
        setTitleColor(color, for: state)
    }
    
    func applyTextAlignment(_ alignment: NSTextAlignment) {
        var buttonAlignment: UIControl.ContentHorizontalAlignment
        
        switch alignment {
        case .left, .justified, .natural:
            buttonAlignment = .left
        case .right:
            buttonAlignment = .right
        default:
            buttonAlignment = .center
        }
        
        self.contentHorizontalAlignment = buttonAlignment
    }
    
}
