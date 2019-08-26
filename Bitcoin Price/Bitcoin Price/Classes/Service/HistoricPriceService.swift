//
//  HistoricPriceService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 01/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class HistoricPriceService: ParseService<HistoricPrice> {

    // MARK: - Variable

    private let apiService = HistoricPriceApiService()

    weak var delegate: HistoricPriceServiceDelegate?

    // MARK: - Public

    func get(reference: ReferenceType, cachedDays days: Int = 0) {
//        if let marketPrice = dbFetch(reference: reference, cachedDays: days) {
//            DispatchQueue.main.async {
//                self.delegate?.marketPriceGetDidComplete(marketPrice: marketPrice)
//            }
//            return
//        }

        apiService.get(reference: reference, success: { (data) in
            self.success(reference: reference, data: data)
        }, failure: { failure in
            self.failure(failure, reference: reference)
        })
    }

    // MARK: - Private

    private func success(reference: ReferenceType, data: Data) {
        DispatchQueue.main.async {
           
            if let marketPrice = self.jsonParse(data: data) {
                self.delegate?.marketPriceGetDidComplete(marketPrice: marketPrice)
               // self.dbInsert(reference: reference, data: data)
            } else {
                self.delegate?.marketPriceGetDidComplete(failure: .server)
            }
        }
    }

    private func failure(_ failure: ServiceFailureType, reference: ReferenceType) {
        DispatchQueue.main.async {
//            if let marketPrice = self.dbFetch(reference: reference) {
//                self.delegate?.marketPriceGetDidComplete(marketPrice: marketPrice)
//            } else {
                self.delegate?.marketPriceGetDidComplete(failure: failure)
//            }
        }
    }

}

protocol HistoricPriceServiceDelegate: class {
    func marketPriceGetDidComplete(marketPrice: HistoricPrice)
    func marketPriceGetDidComplete(failure: ServiceFailureType)
}
