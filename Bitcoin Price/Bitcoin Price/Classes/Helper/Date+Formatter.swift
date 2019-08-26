//
//  Date+Formatter.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/01/18.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Foundation

extension Date {

    static func fromString(_ string: String, dateFormat: String) -> Date {
        let formatter = DateFormatter()

        formatter.locale = Locale.current
        formatter.dateFormat = dateFormat

        return formatter.date(from: string)!
    }

    func toString(dateFormat: String) -> String {
        let formatter = DateFormatter()

        formatter.locale = Locale.current
        formatter.dateFormat = dateFormat

        return formatter.string(from: self)
    }

}
