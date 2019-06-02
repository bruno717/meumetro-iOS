//
//  AppDateFormatter.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 31/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation

final class AppDateFormatter: DateFormatter {
    
    static let formatters: [DateFormatter] = dateFormatters()
    
    static func dateFormatters() -> [DateFormatter] {
        return ["dd/MM/yyyy HH:mm", "dd/MM/yyyy"].map { dateFormat in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            return dateFormatter
        }
    }
    
    override public func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
                                        for string: String,
                                        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        guard let date = (type(of: self).formatters.compactMap { $0.date(from: string) }).first else {
            error?.pointee = "Invalid AppDateFormat date: \(string)" as NSString
            return false
        }
        obj?.pointee = date as NSDate
        return true
    }
    
    override public func string(for obj: Any?) -> String? {
        guard let date = obj as? Date else { return nil }
        return type(of: self).formatters.compactMap { $0.string(from: date) }.first
    }
    
}
