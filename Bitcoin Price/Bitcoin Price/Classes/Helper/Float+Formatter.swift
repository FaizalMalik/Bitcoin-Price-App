//
//  Float+Formatter.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Foundation

extension Float {

    func toPercentStringWithPlusOrMinus() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .percent
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 1

        let number = NSNumber(value: self)
        if Float(truncating: number) > 0 {
            return  "+" + (formatter.string(from: number) ?? "\(self)")
        }
        else{
            return  "-" + (formatter.string(from: number) ?? "\(self)")
        }
        
    }
    func toPercentString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .percent
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 1
        
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? "\(self)"
    }
    
    func toCurrencyString(fractionDigits: Int? = nil) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.currencySymbol = "$"
        formatter.numberStyle = .currencyAccounting
        formatter.usesGroupingSeparator = true

        if let fractionDigits = fractionDigits {
            formatter.minimumFractionDigits = fractionDigits
            formatter.maximumFractionDigits = fractionDigits
        } else {
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
        }

        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? "\(self)"
    }

    
}
