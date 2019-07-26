//
//  LineDecodable.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 29/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

class LineDecodable: Decodable {
    var id: String? = nil
    var lineType: LineType
    var name = String()
    var situation = String()
    var description = String()
    var type: CompanyType
    var modificationDate = String()
    var statusCellType: StatusCellType?
    
    init(statusCellType: StatusCellType, companyName: String) {
        self.statusCellType = statusCellType
        self.type = .unknow
        self.lineType = .unknow
        self.name = companyName
    }
}
