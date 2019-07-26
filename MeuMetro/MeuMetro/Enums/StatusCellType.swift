//
//  StatusCellType.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 24/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

enum StatusCellType: String, Decodable {
    
    case companyCell
    case lineCell
    case unknow

    init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = StatusCellType(rawValue: label) ?? .unknow
    }
}
