//
//  CurrentPriceService.swift
//  BitcoinPrice
//
//  Created by Faizal on 02/02/18.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Foundation

class CurrentPriceService: ParseService<CurrentPrice> {

    // MARK: - Variable

    weak var delegate: CurrentPriceServiceDelegate?

    private let apiService = CurrentPriceApiService()

    // MARK: - Public

    func get() {
        apiService.get(success: { (data) in
            self.success(data: data)
        }, failure: { failure in
            self.failure(failure)
        })
    }

    // MARK: - Privatexx

    private func success(data: Data) {
        DispatchQueue.main.async {
            if let currentPrice = self.jsonParse(data: data) {
                let date = Date()
                self.delegate?.currentPriceGetDidComplete(currentPrice: currentPrice, date: date, fromCache: false)
                //self.dbInsert(data: data, date: date)
            } else {
                self.delegate?.currentPriceGetDidComplete(failure: .server)
            }
        }
    }

    private func failure(_ failure: ServiceFailureType) {
        DispatchQueue.main.async {
            //TODO: Implement the code for offline support

            self.delegate?.currentPriceGetDidComplete(failure: failure)
        }
    }

}

protocol CurrentPriceServiceDelegate: class {
    func currentPriceGetDidComplete(currentPrice: CurrentPrice, date: Date, fromCache: Bool)
    func currentPriceGetDidComplete(failure: ServiceFailureType)
}
