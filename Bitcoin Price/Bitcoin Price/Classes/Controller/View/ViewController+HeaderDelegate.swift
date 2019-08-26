//
//  ViewController+HeaderDelegate.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import UIKit

extension ViewController: HeaderViewDelegate {

    func headerViewRefreshDidSelect() {
        
        callCurrentPriceService()
        
    }

}
