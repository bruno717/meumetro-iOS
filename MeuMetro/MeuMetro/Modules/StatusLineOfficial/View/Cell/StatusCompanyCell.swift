//
//  StatusCompanyCell.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 24/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import UIKit

class StatusCompanyCell: UITableViewCell, NibReusable {

    @IBOutlet weak var companyImage: UIImageView!
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var lastRefresh: UILabel!
    @IBOutlet weak var refreshDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(line: Line) {
        companyName.text = line.name
        
        if (line.name == String(identifier: .companyMetro)) {
            lastRefresh.isHidden = false
            refreshDate.isHidden = false
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = String(identifier: .dateStatusLine)
            refreshDate.text = dateFormatter.string(from: Date())
        } else {
            lastRefresh.isHidden = true
            refreshDate.isHidden = true
        }
    }
}
