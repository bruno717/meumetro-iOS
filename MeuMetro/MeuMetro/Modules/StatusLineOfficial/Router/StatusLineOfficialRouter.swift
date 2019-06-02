//
//  StatusLineOfficialRouter.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 02/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

class StatusLineOfficialRouter: StatusLineOfficialRouterProtocol, Storyboarded {
    
    static var storyboardName = "StatusLineOfficial"
    
    weak var viewController: UIViewController!

    
    static func assembleModule() -> UIViewController {
        let view: StatusLineOfficialViewController = storyboard.instantiateViewController()
        let service = StatusLineService()
        let remote = StatusLineOfficialRemoteDataManager(service: service)
        let interactor = StatusLineOfficialInteractor(remote: remote)
        let router = StatusLineOfficialRouter()
        let presenter = StatusLineOfficialPresenter(view: view, router: router, interactor: interactor)

        view.presenter = presenter
        
        router.viewController = view
        
        return view
    }
    
}
