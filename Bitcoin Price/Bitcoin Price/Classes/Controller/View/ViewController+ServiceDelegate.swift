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
        bodyView.priceView.setPrice(currentPrice.bpi.rate_float, date: date)
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
        
        var values = [ChartDataEntry]()
        var position = 0.0
        for value in historicPrice.values {
            let dataEntry = ChartDataEntry(x: Double(position), y: Double(value.rate))
             values.append(dataEntry)
               position += 1.0
           // let date = Date.fromString(value.date, dateFormat: "yyyy-MM-dd")
           
            //values.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        bodyView.historyView.setLoaded(true)
        bodyView.historyView.setPrices(firstPrice: firsPrice, lastPrice: lastPrice)
        bodyView.historyView.setChartData(reference: ref, values: values)
        bodyView.historyView.spinnerView.hide()
        
        
    }
    
    func historicPriceGetDidComplete(failure: ServiceFailureType) {
        bodyView.historyView.setLoaded(true)
        bodyView.historyView.spinnerView.hide()
    }
    
}
