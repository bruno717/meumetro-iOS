//
//  StatusLineOfficialCellTableViewCell.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 28/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import UIKit

class StatusLineOfficialCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var labelLineName: UILabel!
    @IBOutlet private weak var labelStatusLine: UILabel!
    
    @IBOutlet private weak var imageViewIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item: Line) {
        labelLineName.text = item.name
        labelStatusLine.text = item.status
    }
}
