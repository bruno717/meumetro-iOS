//
//  CompanyType.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 17/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

enum CompanyType: String, Decodable {
    case metro = "M"
    case cptm = "C"
    case viaQuatro = "4"
    case viaMobilidade = "5"
    case unknow
    
    init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = CompanyType(rawValue: label) ?? .unknow
    }
}
