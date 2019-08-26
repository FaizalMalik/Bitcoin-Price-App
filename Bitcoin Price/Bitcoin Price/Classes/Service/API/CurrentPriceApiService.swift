//
//  CurrentPriceApiService.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Alamofire
import Foundation

class CurrentPriceApiService: ApiService {

    // MARK: - Public

    func get(success: @escaping (Data) -> Void,
             failure: @escaping (ServiceFailureType) -> Void) {

        _ = self.sessionManager.request(CurrentPriceApiRouter.get([:]))
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

}
