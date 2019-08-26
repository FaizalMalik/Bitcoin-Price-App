//
//  Result.swift
//  BitcoinPrice
//
//  Created by Faizal on 24/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
