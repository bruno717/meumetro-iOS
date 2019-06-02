//
//  ErrorParser.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

protocol ErrorParser {
    
    func parseError(from data: Data?, statusCode: Int) -> Error?
    
}
