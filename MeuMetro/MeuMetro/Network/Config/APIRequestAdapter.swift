//
//  APIRequestAdapter.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

final class APIRequestAdapter: RequestAdapter {
    
    private enum Constants {
        static let authorizationHeader = "security_key"
        static let authenticatePassword = "e871f5a73c097ec22f27ebe917ed9f87"
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var request = urlRequest
        request.setValue(Constants.authenticatePassword, forHTTPHeaderField: Constants.authorizationHeader)
        return request
    }
    
}
