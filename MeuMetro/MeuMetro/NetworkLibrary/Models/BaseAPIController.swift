//
//  BaseAPIController.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

final class BaseAPIController: APIControllerProtocol {
    
    let manager: SessionManager
    
    init() {
        URLCache.shared.removeAllCachedResponses()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let manager = Alamofire.SessionManager(configuration: configuration)
        self.manager = manager
    }
    
    var baseURL: String {
        return String()
    }
}
