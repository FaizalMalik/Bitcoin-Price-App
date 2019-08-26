//
//  Result.swift
//  BitcoinPrice
//
//  Created by Faizal on 24/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
