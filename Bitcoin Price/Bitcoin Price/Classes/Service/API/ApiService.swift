//
//  ApiService.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Alamofire
import Foundation

class ApiService {

    // MARK: - Variable

    let sessionManager: SessionManager = {
        let conf = URLSessionConfiguration.default

        conf.timeoutIntervalForRequest = Params.timeout
        conf.timeoutIntervalForResource = Params.timeout

        return SessionManager(configuration: conf)
    }()

    // MARK: - Other

    struct Params {
        static let baseUrl = URL(string: Bundle.main.apiBaseUrl())!
        static let timeout: Double = 15
    }

}
