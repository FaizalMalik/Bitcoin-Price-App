//
//  ViewController+ServiceDelegate.swift
//  BitcoinPrice
//
//  Created by Faizal on 02/02/19.
//  Copyright © 2019 Faizal . All rights reserved.
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


extension ViewController: HistoricPriceServiceDelegate {
    
    func historicPriceGetDidComplete(historicPrice: HistoricPrice) {
        let ref = UserDefaults.standard.reference()
        
        let firsPrice = historicPrice.values.first?.rate ?? 0
        let lastPrice = historicPrice.values.last?.rate ?? 0
    
        
        bodyView.historyView.setLoaded(true)
        bodyView.historyView.setPrices(firstPrice: firsPrice, lastPrice: lastPrice)
        bodyView.historyView.setChartData(reference: ref, values: historicPrice.values)
        bodyView.historyView.spinnerView.hide()
    }
    
    func historicPriceGetDidComplete(failure: ServiceFailureType) {
        bodyView.historyView.setLoaded(true)
        bodyView.historyView.spinnerView.hide()
    }
    
}
