//
//  APIController.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

final class APIController: APIControllerProtocol {
    
    static let `default` = APIController()
    let manager: SessionManager
    
    private init() {
        URLCache.shared.removeAllCachedResponses()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.adapter = APIRequestAdapter()
        self.manager = manager
    }
    
    var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("Fail to load base url, implement BASE_URL key on info.plist and add in project settings")
        }
        
        return url
    }
    
}
