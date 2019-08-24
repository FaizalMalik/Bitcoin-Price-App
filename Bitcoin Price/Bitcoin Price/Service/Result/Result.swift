//
//  Result.swift
//  Bitcoin Price
//
//  Created by Faizal on 8/24/19.
//  Copyright © 2019 Faizal. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
