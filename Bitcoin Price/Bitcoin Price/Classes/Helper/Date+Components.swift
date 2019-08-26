//
//  Date+Components.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Foundation

extension Date {

    var startOfBitcoin: Date {
        return Date.fromString("2009-01-03", dateFormat: "yyyy-MM-dd")
    }

}
