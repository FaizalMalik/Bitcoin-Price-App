//
//  String+Localized.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import UIKit

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
   
    func removeFormatAmount() -> Double {
        let formatter = NumberFormatter()
        
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.decimalSeparator = ","
        
        return formatter.number(from: self) as? Double ?? 0
    }

}
