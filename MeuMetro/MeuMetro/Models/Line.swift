//
//  Line.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 07/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

struct Line {
    
    let name: String
    let status: String
    var description: String?
    let lineType: LineType
    let statusCellType: StatusCellType
    let companyType: CompanyType

    init(lineDecodable: LineDecodable) {
        name = lineDecodable.name
        status = lineDecodable.situation
        description = lineDecodable.description
        if lineDecodable.lineType == .line1Blue {
            description = "asdasdasdadadasdadasdasdasdasd hdsghshgf"
        } else if lineDecodable.lineType == .line3Red {
            description = "Por motivo de Obras , os trens da linha 7 - RUBI estão circulando com intervalos maiores entre as estações LUZ e FRANCISCO MORATO ."
        }
        lineType = lineDecodable.lineType
        companyType = lineDecodable.type
        
        if let statusCellType = lineDecodable.statusCellType {
            self.statusCellType = statusCellType
        } else {
            self.statusCellType = .lineCell
        }
    }
}
