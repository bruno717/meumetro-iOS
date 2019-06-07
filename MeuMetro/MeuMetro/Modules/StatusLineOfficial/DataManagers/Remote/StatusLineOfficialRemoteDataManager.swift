//
//  StatusLineOfficialRemoteDataManager.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 29/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift

final class StatusLineOfficialRemoteDataManager: StatusLineOfficialRemoteDataManagerProtocol {
    
    private let service: StatusLineServiceProtocol
    
    init(service: StatusLineServiceProtocol) {
        self.service = service
    }
    
    func getLinesStatusOfficial() -> Single<[Line]> {
        return service.getLinesStatusOfficial()
            .map { lineDecodableList in
                return lineDecodableList.map { lineDecodable in
                    return Line(lineDecodable: lineDecodable)
                }
            }
    }
    
}
