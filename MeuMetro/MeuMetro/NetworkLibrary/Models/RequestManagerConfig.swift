//
//  RequestManagerConfig.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

final class RequestManagerConfig {
    
    let apiController: APIControllerProtocol
    let errorParser: ErrorParser?
    let logLevel: NetworkDebugManager.LogLevel
    let decoder: JSONDecoder
    let encoder: JSONEncoder
    
    init(apiController: APIControllerProtocol = BaseAPIController(),
         errorParser: ErrorParser? = nil,
         logLevel: NetworkDebugManager.LogLevel = .all,
         decoder: JSONDecoder = JSONDecoder(),
         encoder: JSONEncoder = JSONEncoder()) {
        self.apiController = apiController
        self.errorParser = errorParser
        self.logLevel = logLevel
        self.decoder = decoder
        self.encoder = encoder
    }
    
}
