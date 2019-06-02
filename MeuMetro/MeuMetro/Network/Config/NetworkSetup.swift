//
//  NetworkSetup.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 31/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkSetup {
    
    private init() {
        // Instantiate only on setup function
    }
    
    static func initialize() {
        let networkSetup = NetworkSetup()
        networkSetup.setupRequestManager()
    }
    
    private func setupRequestManager() {
        let apiController = APIController.default
        
        let dateFormatter = AppDateFormatter()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        
        let config = RequestManagerConfig(apiController: apiController,
                                          errorParser: nil,
                                          logLevel: .all,
                                          decoder: decoder,
                                          encoder: encoder)
        
        RequestManager.config = config
    }
    
}
