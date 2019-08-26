//
//  File.swift
//  Bitcoin Price
//
//  Created by Faizal on 8/24/19.
//  Copyright © 2019 Faizal. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
