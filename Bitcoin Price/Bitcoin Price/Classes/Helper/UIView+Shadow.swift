//
//  UIView+Shadow.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import UIKit

extension UIView {

    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 3

        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.125
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 0.5
    }

}
