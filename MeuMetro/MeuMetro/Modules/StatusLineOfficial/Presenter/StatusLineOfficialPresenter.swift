//
//  StatusLineOfficialPresenter.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 29/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift

final class StatusLineOfficialPresenter: StatusLineOfficialPresenterProtocol {
    
    private weak var view: StatusLineOfficialViewProtocol!
    private let router: StatusLineOfficialRouterProtocol!
    private let interactor: StatusLineOfficialInteractorProtocol!
    
    private let disposeBag = DisposeBag()
    
    init(view: StatusLineOfficialViewProtocol!, router: StatusLineOfficialRouterProtocol, interactor: StatusLineOfficialInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }

    func loadStatusLinesOfficial() {
        interactor.getLinesStatusOfficial()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { response in
                self.view.showStatusLines(lines: response)
            }, onError: { error in
                print("Erro!")
            })
            .disposed(by: disposeBag)
    }
}
