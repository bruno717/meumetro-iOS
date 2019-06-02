//
//  Encodable+Parameters.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import Alamofire

extension Encodable {
    
    var parameters: Parameters? {
        guard let data = try? RequestManager.config.encoder.encode(self) else {
            return nil
        }
        
        let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonData.flatMap{ $0 as? Parameters }
    }
    
}
