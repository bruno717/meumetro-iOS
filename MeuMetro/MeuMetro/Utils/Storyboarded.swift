//
//  Storyboarded.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 02/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    
    static var storyboardName: String { get }
    static var storyboard: UIStoryboard { get }
    
}

extension Storyboarded {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
}
