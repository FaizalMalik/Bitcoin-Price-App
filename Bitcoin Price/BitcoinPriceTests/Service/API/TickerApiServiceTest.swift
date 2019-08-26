//
//  CurrentPriceApiServiceTest.swift
//  BitcoinPriceTests
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import XCTest
@testable import BitcoinPrice

class CurrentPriceApiServiceTest: ApiServiceTest {

    private let service = CurrentPriceApiService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
    }

    // MARK: - Test

    func testGetCurrentPriceApiService() {
        service.get(success: { _ in
            self.success()
        }, failure: { failure in
            self.failure(failure)
        })

        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}
