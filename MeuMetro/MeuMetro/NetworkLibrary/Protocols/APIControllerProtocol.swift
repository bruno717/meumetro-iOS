//
//  APIControllerProtocol.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

protocol APIControllerProtocol {
    
    var manager: Alamofire.SessionManager { get }
    var baseURL: String { get }
    
}
