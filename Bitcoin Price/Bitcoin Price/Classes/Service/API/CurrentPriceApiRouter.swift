//
//  CurrentPriceApiRouter.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Alamofire
import Foundation

enum CurrentPriceApiRouter: URLRequestConvertible {

    // MARK: - Router

   case get([String: String])

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: ApiService.Params.baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .get( _):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }

        return urlRequest
    }

    // MARK: - Private

    private var method: HTTPMethod {
        switch self {
        case .get: return .get
        }
    }

    private var path: String {
        switch self {
        case .get: return "/currentprice.json"
        }
    }

}
