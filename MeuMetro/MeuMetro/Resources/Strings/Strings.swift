//
//  Strings.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 10/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Status Line Official
    enum Identifier: String {
        
        // MARK
        case statusNormalOperation
        case statusParalyzedOperation
        case statusFinishedOperation
        case companyMetro
        case companyCptm
        case dateStatusLine
    }
    
    init(identifier: Identifier, comment: String = String()) {
        self.init(stringLiteral: NSLocalizedString(identifier.rawValue, comment: comment))
    }
    
    init(identifier: Identifier, count: Int, comment: String = String()) {
        let format = NSLocalizedString(identifier.rawValue, comment: String())
        self.init(format: format, count)
    }
}
