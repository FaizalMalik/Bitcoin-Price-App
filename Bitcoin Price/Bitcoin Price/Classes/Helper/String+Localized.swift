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

}
