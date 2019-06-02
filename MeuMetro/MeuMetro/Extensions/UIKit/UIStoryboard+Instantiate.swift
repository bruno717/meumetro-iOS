//
//  UIStoryboard+Instantiate.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 02/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Failed to instantiate ViewController with identifier \(identifier)")
        }
        return viewController
    }
    
}
