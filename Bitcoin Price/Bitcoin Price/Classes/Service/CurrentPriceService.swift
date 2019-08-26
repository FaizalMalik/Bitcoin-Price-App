//
//  CurrentPriceService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
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
            if let ticker = self.jsonParse(data: data) {
                let date = Date()
                self.delegate?.tickerGetDidComplete(ticker: ticker, date: date, fromCache: false)
                //self.dbInsert(data: data, date: date)
            } else {
                self.delegate?.tickerGetDidComplete(failure: .server)
            }
        }
    }

    private func failure(_ failure: ServiceFailureType) {
        DispatchQueue.main.async {
            //TODO: Implement the code for offline support

            self.delegate?.tickerGetDidComplete(failure: failure)
        }
    }

}

protocol CurrentPriceServiceDelegate: class {
    func tickerGetDidComplete(ticker: CurrentPrice, date: Date, fromCache: Bool)
    func tickerGetDidComplete(failure: ServiceFailureType)
}
