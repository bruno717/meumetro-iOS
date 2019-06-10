//
//  String+Regex.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

extension String {
    
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.compactMap {
                guard let range = Range($0.range, in: text) else  {
                    return nil
                }
                return String(text[range])
            }
        } catch {
            debugPrint("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func removeAccents(text: String) -> String {
        let textWithoutAccents = text.folding(options: .diacriticInsensitive, locale: .current)
        return textWithoutAccents
    }
    
}
