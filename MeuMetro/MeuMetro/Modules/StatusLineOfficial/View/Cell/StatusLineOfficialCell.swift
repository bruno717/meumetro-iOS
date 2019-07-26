//
//  StatusLineOfficialCellTableViewCell.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 28/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import UIKit

class StatusLineOfficialCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var heightContraint: NSLayoutConstraint!
    @IBOutlet private weak var heigthNameLine: NSLayoutConstraint!
    @IBOutlet private weak var heightLabelDescription: NSLayoutConstraint!
    
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var leftView: UIView!
    @IBOutlet private weak var rightView: UIView!
    
    @IBOutlet private weak var buttonExpandView: UIButton!
    
    @IBOutlet private weak var labelLineName: UILabel!
    @IBOutlet private weak var labelStatusLine: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!

    private let defaultHeight = CGFloat(83)
    private let expandedHeight = CGFloat(150)
    
    private var delegate: StatusLineOfficialCellDelegate?
    private var isCellSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(line: Line) {
        heightContraint.constant = defaultHeight
        buttonExpandView.transform = CGAffineTransform.identity

        labelLineName.text = line.name
        labelStatusLine.text = line.status
        leftView.backgroundColor = line.lineType.getColor()
        setupStatus(line: line)
    }
    
    func setDelegate(delegate: StatusLineOfficialCellDelegate) {
        self.delegate = delegate
    }
    
    func animateStatusDescription(selected: Bool) {
        isCellSelected = !isCellSelected
        
        if isCellSelected {
            heightContraint.constant = defaultHeight + labelDescription.heightByLines()
            UIView.animate(withDuration: 0.4) {
                self.labelDescription.alpha = 1
                self.buttonExpandView.transform = CGAffineTransform.init(rotationAngle: .pi)
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.labelDescription.alpha = 0
                self.buttonExpandView.transform = CGAffineTransform.identity
            }
            heightContraint.constant = defaultHeight
        }
        heightLabelDescription.constant = labelDescription.heightByLines()
        contentView.updateConstraints()
        contentView.setNeedsDisplay()
    }
    
    private func setupStatus(line: Line) {
        
        labelDescription.alpha = 0
        
        if line.description?.isEmpty == true {
            buttonExpandView.isHidden = true
        } else {
            labelDescription.text = line.description
            buttonExpandView.isHidden = false
        }
        
        let statusNormal = String(identifier: .statusNormalOperation).lowercased()
        let statusParalyzed = String(identifier: .statusParalyzedOperation).lowercased()
        let statusFinished = String(identifier: .statusFinishedOperation).lowercased()

        switch line.status.lowercased() {
        case statusNormal:
            rightView.backgroundColor = UIColor.statusLineNormal
            
        case statusParalyzed,
             statusFinished:
            rightView.backgroundColor = UIColor.statusLineStopped

        default:
            rightView.backgroundColor = UIColor.statusLineSlow
        }
    }
    
    @IBAction func arrowTapped(_ sender: UIButton) {
        delegate?.arrowTapped(cell: self)
    }
}

protocol StatusLineOfficialCellDelegate {
    func arrowTapped(cell: StatusLineOfficialCell)
}
