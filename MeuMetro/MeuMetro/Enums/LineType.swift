//
//  LineType.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 10/06/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import UIKit

enum LineType: String, Decodable {
    
    case line1Blue = "LINE_1_BLUE"
    case line2Green = "LINE_2_GREEN"
    case line3Red = "LINE_3_RED"
    case line4Yellow = "LINE_4_YELLOW"
    case line5Lilac = "LINE_5_LILAC"
    case line7Ruby = "LINE_7_RUBY"
    case line8Diamond = "LINE_8_DIAMOND"
    case line9Emerald = "LINE_9_EMERALD"
    case line10Turquoise = "LINE_10_TURQUOISE"
    case line11Coral = "LINE_11_CORAL"
    case line12Sapphire = "LINE_12_SAPPHIRE"
    case line13Jade = "LINE_13_JADE"
    case line15Silver = "LINE_15_SILVER"
    case unknow

    
    init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = LineType(rawValue: label) ?? .unknow
    }
    
    func getColor() -> UIColor {
        switch self {
        case .line1Blue:
            return UIColor.line1Blue
            
        case .line2Green:
            return UIColor.line2Green
            
        case .line3Red:
            return UIColor.line3Red
            
        case .line4Yellow:
            return UIColor.line4Yellow
            
        case .line5Lilac:
            return UIColor.line5Lilac
            
        case .line7Ruby:
            return UIColor.line7Ruby
            
        case .line8Diamond:
            return UIColor.line8Diamond
            
        case .line9Emerald:
            return UIColor.line9Emerald
            
        case .line10Turquoise:
            return UIColor.line10Turquoise
            
        case .line11Coral:
            return UIColor.line11Coral
            
        case .line12Sapphire:
            return UIColor.line12Sapphire

        case .line13Jade:
            return UIColor.line13Jade
            
        case .line15Silver:
            return UIColor.line15Silver
            
        default:
            return UIColor.black
        }
    }
}
