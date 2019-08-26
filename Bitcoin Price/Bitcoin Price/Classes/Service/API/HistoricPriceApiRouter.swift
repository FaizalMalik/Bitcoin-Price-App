//
//  HistoricPriceApiRouter.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//
import Alamofire
import Foundation

enum HistoricPriceApiRouter: URLRequestConvertible {

    // MARK: - Router

    case get([String: String])

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: ApiService.Params.baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .get(let params):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
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
        case .get: return "/historical/close.json"
        }
    }

}
