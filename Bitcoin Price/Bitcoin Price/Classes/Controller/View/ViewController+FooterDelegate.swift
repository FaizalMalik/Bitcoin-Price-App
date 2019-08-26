//
//  ViewController+FooterDelegate.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import UIKit

extension ViewController: FooterViewDelegate {

    func footerViewButtonDidSelect(type: ReferenceType) {
        UserDefaults.standard.setReference(type)
       callHistoricPriceService(reference: type)
    }

}
