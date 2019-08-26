//
//  CurrentPriceApiServiceTest
//  Bitcoin PriceTests
//
//  Created by Faizal on 8/26/19.
//  Copyright © 2019 Faizal. All rights reserved.


import XCTest
@testable import Bitcoin_Price

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
