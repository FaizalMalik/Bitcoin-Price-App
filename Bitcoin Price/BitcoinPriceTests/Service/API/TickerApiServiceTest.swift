//
//  CurrentPriceApiServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

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
