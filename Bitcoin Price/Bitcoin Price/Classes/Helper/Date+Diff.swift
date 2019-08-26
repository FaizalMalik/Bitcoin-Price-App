//
//  Date+Diff.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Foundation

extension Date {

    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }

}
