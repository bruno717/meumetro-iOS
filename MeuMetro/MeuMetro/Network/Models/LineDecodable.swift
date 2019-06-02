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
    var lineType = String()
    var name = String()
    var situation = String()
    var description = String()
    var type: String? = nil
    var modificationDate = String()
    
    init() {
        // Create a default object
    }
}
