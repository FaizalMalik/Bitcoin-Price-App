//
//  ViewController+ServiceDelegate.swift
//  BitcoinPrice
//
//  Created by Faizal on 02/02/18.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Charts
import NotificationBannerSwift
import UIKit

extension ViewController: CurrentPriceServiceDelegate {

    func currentPriceGetDidComplete(currentPrice: CurrentPrice, date: Date, fromCache: Bool) {
        bodyView.priceView.setPrice(132, date: date)
        bodyView.priceView.spinnerView.hide()

        if fromCache {
            StatusBarNotificationBanner.noConnection.show()
        }
    }

    func currentPriceGetDidComplete(failure: ServiceFailureType) {
        bodyView.priceView.setPrice(0)
        bodyView.priceView.spinnerView.hide()

        switch failure {
        case .server:
            StatusBarNotificationBanner.serverFailure.show()
        case .connection:
            StatusBarNotificationBanner.noConnection.show()
        }
    }

}
