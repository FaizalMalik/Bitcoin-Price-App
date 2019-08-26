//
//  HistoricPriceService.swift
//  BitPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal. All rights reserved.
//

import Foundation

class HistoricPriceService: ParseService<HistoricPrice> {

    // MARK: - Variable

    private let apiService = HistoricPriceApiService()

    weak var delegate: HistoricPriceServiceDelegate?

    // MARK: - Public

    func get(reference: ReferenceType, cachedDays days: Int = 0) {
 
        //TODO: Implement the Offline fetch method

        apiService.get(reference: reference, success: { (data) in
            self.success(reference: reference, data: data)
        }, failure: { failure in
            self.failure(failure, reference: reference)
        })
    }

    // MARK: - Private

    private func success(reference: ReferenceType, data: Data) {
        DispatchQueue.main.async {
           
            if let historicPrice = self.jsonParse(data: data) {
                self.delegate?.historicPriceGetDidComplete(historicPrice: historicPrice)
                //TODO: Implement offline storage method
                
            } else {
                self.delegate?.historicPriceGetDidComplete(failure: .server)
            }
        }
    }

    private func failure(_ failure: ServiceFailureType, reference: ReferenceType) {
        DispatchQueue.main.async {
                //TODO: Implement offline storage method
                self.delegate?.historicPriceGetDidComplete(failure: failure)

        }
    }

}

protocol HistoricPriceServiceDelegate: class {
    func historicPriceGetDidComplete(historicPrice: HistoricPrice)
    func historicPriceGetDidComplete(failure: ServiceFailureType)
}
