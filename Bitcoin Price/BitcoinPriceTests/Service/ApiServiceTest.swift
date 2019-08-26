//
//  ApiServiceTest.swift
//  BitcoinPriceTests
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import XCTest
@testable import BitcoinPrice

class ApiServiceTest: XCTestCase {

    var expectation: XCTestExpectation?

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        expectation = self.expectation(description: "delegate")
    }

    // MARK: - Public

    func success() {
        XCTAssertTrue(true)
        expectation?.fulfill()
    }

    func failure(_ failure: ServiceFailureType) {
        if failure == .server {
            XCTFail("server service error")
        } else {
            XCTFail("connection service error")
        }
        expectation?.fulfill()
    }

}
