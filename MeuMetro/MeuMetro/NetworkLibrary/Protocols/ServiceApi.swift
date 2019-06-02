//
//  ServiceApi.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

protocol ServiceApi {
    
    var api: String { get }
    
}

extension ServiceApi where Self: RawRepresentable, Self.RawValue == String {
    
    var api: String {
        return rawValue
    }
    
}
