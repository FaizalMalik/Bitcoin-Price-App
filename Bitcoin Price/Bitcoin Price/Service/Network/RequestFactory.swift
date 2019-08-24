//
//  RequestFactory.swift
//  Bitcoin Price
//
//  Created by Faizal on 8/24/19.
//  Copyright © 2019 Faizal. All rights reserved.
//
import Foundation

final class RequestFactory {
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
