//
//  ServiceVersion.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

protocol ServiceVersion {
    
    var value: String { get }
    var placeHolder: String { get }
    
}

extension ServiceVersion {
    
    var placeHolder: String {
        return "version"
    }
    
}

extension ServiceVersion where Self: RawRepresentable, Self.RawValue == String {
    
    var value: String {
        return rawValue
    }
    
}
