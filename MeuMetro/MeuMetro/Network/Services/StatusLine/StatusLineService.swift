//
//  StatusLineService.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift

final class StatusLineService: StatusLineServiceProtocol {
    
    private enum API: String, ServiceApi {
        case statusOfficial = "status/official"
    }
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
    
    func getLinesStatusOfficial() -> Single<[LineDecodable]> {
        let endpoint = Endpoint(method: .get, api: API.statusOfficial)
        return requestManager.request(endpoint: endpoint).asSingle()
    }
    
}
