//
//  UILabel+Height.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 26/07/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import UIKit

extension UILabel {
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? String()) as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font ?? 0], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    
    func heightByLines() -> CGFloat {
        let lineHeight = CGFloat(16)
        let height = (lineHeight * CGFloat(calculateMaxLines()) + lineHeight)
        return height
    }
}
