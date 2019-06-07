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
    let description: String?
    
    init(lineDecodable: LineDecodable) {
        name = lineDecodable.name
        status = lineDecodable.situation
        description = lineDecodable.description
    }
    
}
