//
//  NetworkDebugManager.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkDebugManager {
    
    enum LogLevel {
        case basic
        case all
    }
    
    static func log<T>(_ response: DataResponse<T>) {
        #if DEBUG
        
        log(message: "==> Network Request: \(String(describing: response.request))")
        log(message: "==> Network Result: \(response.result)")
        log(message: "==> Network Error: \(String(describing: response.result.error))")
        
        if RequestManager.config.logLevel == .all {
            log(message: "==> Network Headers: \(String(describing: response.request?.allHTTPHeaderFields))")
            
            let body = String(data: response.request?.httpBody ?? Data(), encoding: .utf8)
            log(message: "==> Network Body: \(String(describing: body))")
            
            let responseData = String(data: response.data ?? Data(), encoding: .utf8)
            log(message: "==> Network Response: \(String(describing: responseData))")
            log(message: "==> Network Response: \(String(describing: response.response))")
        }
        
        #endif
    }
    
    private static func log(message: String) {
        debugPrint(message.replacingOccurrences(of: "\\", with: ""))
    }
}
