//
//  StatusLineOfficialRemoteDataManager.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 29/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

final class StatusLineOfficialRemoteDataManager: StatusLineOfficialRemoteDataManagerProtocol {
    
    private let service: StatusLineServiceProtocol
    
    init(service: StatusLineServiceProtocol) {
        self.service = service
    }
    
    func getLinesStatusOfficial() -> Single<[Line]> {
        return service.getLinesStatusOfficial()
            .map { lineDecodableList in
                var linesFiltered = [LineDecodable]()
                var linesMetro = lineDecodableList.filter { lineDecodable in
                    return lineDecodable.type == .metro
                        || lineDecodable.type == .viaQuatro
                        || lineDecodable.type == .viaMobilidade
                }
                
                var linesCptm = lineDecodableList.filter { lineDecodable in
                    return lineDecodable.type == .cptm
                }
                let companyMetro = LineDecodable(statusCellType: .companyCell, companyName: String(identifier: .companyMetro))
                linesMetro.insert(companyMetro, at: 0)
                
                let companyCptm = LineDecodable(statusCellType: .companyCell, companyName: String(identifier: .companyCptm))
                linesCptm.insert(companyCptm, at: 0)
                
                linesFiltered.append(contentsOf: linesMetro)
                linesFiltered.append(contentsOf: linesCptm)

                return linesFiltered.map { lineDecodable in
                    return Line(lineDecodable: lineDecodable)
                }
            }
    }
    
}
