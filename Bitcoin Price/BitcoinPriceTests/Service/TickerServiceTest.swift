//
//  CurrentPriceServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 03/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

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
//    func tickerGetDidComplete(ticker: CurrentPrice, date: Date, fromCache: Bool) {
//        
//    }

    func tickerGetDidComplete(ticker: Ticker, date: Date, fromCache: Bool) {
        self.success()
    }

    func tickerGetDidComplete(failure: ServiceFailureType) {
        self.failure(failure)
    }

}
