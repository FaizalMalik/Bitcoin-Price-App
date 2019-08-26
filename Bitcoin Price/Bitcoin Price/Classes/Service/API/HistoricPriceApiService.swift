//
//  HistoricPriceApiService.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Alamofire
import Foundation

class HistoricPriceApiService: ApiService {

    // MARK: - Public

    func get(reference: ReferenceType,
             success: @escaping (Data) -> Void,
             failure: @escaping (ServiceFailureType) -> Void) {

        let params = parameters(reference: reference)

        _ = self.sessionManager.request(HistoricPriceApiRouter.get(params))
            .validate(statusCode: [200])
            .responseJSON { response in
                guard let data = response.data else {
                    failure(.connection)
                    return
                }

                if let error = response.error {
                    if error as? AFError == nil {
                        failure(.connection)
                    } else {
                        failure(.server)
                    }
                    return
                }

                success(data)
        }
    }

    // MARK: - Private

    private func parameters(reference: ReferenceType) -> [String: String] {
        let endDate: Date

        switch reference {
        case .week:
            endDate = Date().minus(days: 7)

        case .month:
            endDate = Date().minus(days: 30)
            
        case .year:
            endDate = Date().minus(days: 360)
           
//        case .all:
//            start = Date().startOfBitcoin
//            timespan = "\(Date().years(from: start))years"
         default:
            endDate = Date().minus(days: 7)
        }
//https://api.coindesk.com/v1/bpi/historical/close.json?start=2019-01-01&end=2019-01-31
        var params: [String: String] = [:]
        params["end"] = Date().toString(dateFormat: "yyyy-MM-dd")
        params["start"] = endDate.toString(dateFormat: "yyyy-MM-dd")
       

        return params
    }

}
