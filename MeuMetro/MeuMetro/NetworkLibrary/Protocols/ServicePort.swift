//
//  ServicePort.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

protocol ServicePort {
    
    var value: String { get }
    var placeHolder: String { get }
    
}

extension ServicePort {
    
    var placeHolder: String {
        return "port"
    }
    
}

extension ServicePort where Self: RawRepresentable, Self.RawValue == Int {
    
    var value: String {
        return "\(rawValue)"
    }

}
