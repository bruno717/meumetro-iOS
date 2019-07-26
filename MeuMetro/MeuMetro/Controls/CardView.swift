//
//  CardView.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 07/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
//    @IBInspectable var shadowOffSetWidth: CGFloat = 0
//    @IBInspectable var shadowOffSetHeight: CGFloat = 1
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: CGFloat = 0.1

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: 1)
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
    }
}
