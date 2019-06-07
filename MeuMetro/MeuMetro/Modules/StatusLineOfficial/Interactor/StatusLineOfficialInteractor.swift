//
//  StatusLineOfficialInteractor.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 02/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift

class StatusLineOfficialInteractor: StatusLineOfficialInteractorProtocol {
   
    private let remote: StatusLineOfficialRemoteDataManagerProtocol
    
    init(remote: StatusLineOfficialRemoteDataManagerProtocol) {
        self.remote = remote
    }
    
    func getLinesStatusOfficial() -> Single<[Line]> {
        return remote.getLinesStatusOfficial()
    }

}
