//
//  CurrentPriceServiceTest.swift
//  BitcoinPriceTests
//
//  Created by Faizal on 03/02/18.
//  Copyright © 2018 Faizal . All rights reserved.
//

import XCTest
@testable import BitcoinPrice

class CurrentPriceServiceTest: ApiServiceTest {

    private let service = CurrentPriceService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        service.delegate = self
    }

    // MARK: - Test

    func testGetCurrentPriceService() {
        service.get()
        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}

extension CurrentPriceServiceTest: CurrentPriceServiceDelegate {
//    func currentPriceGetDidComplete(currentPrice: CurrentPrice, date: Date, fromCache: Bool) {
//        
//    }

    func currentPriceGetDidComplete(currentPrice: currentPrice, date: Date, fromCache: Bool) {
        self.success()
    }

    func currentPriceGetDidComplete(failure: ServiceFailureType) {
        self.failure(failure)
    }

}
