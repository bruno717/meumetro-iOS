//
//  StatusLineOfficialProtocols.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 29/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - View
protocol StatusLineOfficialViewProtocol: class {
    
    func showStatusLines(lines: [Line])
    
}

// MARK: - Presenter
protocol StatusLineOfficialPresenterProtocol: class {
    func loadStatusLinesOfficial()
}

// MARK: - Router
protocol StatusLineOfficialRouterProtocol: class {
    
}

// MARK: - Interactor
protocol StatusLineOfficialInteractorProtocol: class {
    func getLinesStatusOfficial() -> Single<[Line]>
}

// MARK: - DataManager
protocol StatusLineOfficialRemoteDataManagerProtocol: class {
    func getLinesStatusOfficial() -> Single<[Line]>
}
