//
//  String+Localized.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/01/18.
//  Copyright © 2018 Faizal . All rights reserved.
//

import UIKit

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
