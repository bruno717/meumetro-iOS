//
//  Style.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 07/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

extension StyleBuilder {
    
    // MARK: - Buttons
    
    
    func apply(onShadowView stylable: Stylable) {
        Style.withBackgroundColor(.clear)
            .withBackgroundColor(.white)
            .withShadowRadius(1)
            .withShadowOpacity(0.5)
            .withShadowOffset(CGSize(width: 1, height: 1))
            .withShadowColor(.lightGray)
            .withMasksToBounds(false)
            .apply(on: stylable)
    }
    
    // MARK: - TextFields
    
    
}

// MARK: - Static Styles
extension StyleBuilder {
    
    static func initialize() {
        let style = Style
        style.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBar.appearance()
//        let backImage = UIImage(identifier: .backButton)
//        appearance.backIndicatorImage = backImage
//        appearance.backIndicatorTransitionMaskImage = backImage
        appearance.backgroundColor = .white
        appearance.barTintColor = .white
//        appearance.tintColor = CompanyColor.primary
//        appearance.titleTextAttributes = [.font: CompanyFont.title,
//                                          .foregroundColor: CompanyColor.primary]
        appearance.isTranslucent = false
    }
    
}
