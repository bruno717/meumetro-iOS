//
//  StatusLineOfficialCellTableViewCell.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 28/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import UIKit

class StatusLineOfficialCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var cardView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    @IBOutlet private weak var labelLineName: UILabel!
    @IBOutlet private weak var labelStatusLine: UILabel!
    
    @IBOutlet private weak var imageViewIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        cardView.layer.cornerRadius = 2
//        cardView.layer.shadowColor = UIColor.black.cgColor
//        cardView.layer.shadowOffset = CGSize(width: 0, height: 5)
//        let shadowPath = UIBezierPath(roundedRect: cardView.bounds, cornerRadius: cardView.layer.cornerRadius)
//        cardView.layer.shadowPath = shadowPath.cgPath
//        cardView.layer.shadowOpacity = Float(0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(line: Line) {
        labelLineName.text = line.name
        labelStatusLine.text = line.status
        setupStatus(line: line)
    }
    
    private func setupStatus(line: Line) {
        if (line.status.lowercased() == "Operação normal".lowercased()) {
            rightView.backgroundColor = UIColor.green
        } else {
            rightView.backgroundColor = UIColor.yellow
        }
    }
}
