//
//  Bitcoin_PriceTests.swift
//  Bitcoin PriceTests
//
//  Created by Faizal on 8/26/19.
//  Copyright © 2019 Faizal. All rights reserved.


import XCTest
@testable import Bitcoin_Price

class ApiServiceTest : XCTestCase {
    
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
