//
//  CurrentPriceServiceTest
//  Bitcoin PriceTests
//
//  Created by Faizal on 8/26/19.
//  Copyright © 2019 Faizal. All rights reserved.

import XCTest
@testable import Bitcoin_Price

class CurrentPriceServiceTest: ApiServiceTest {

    private let service = CurrentPriceService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        service.delegate = self
    }

    // MARK: - Test

    func testGetCurrentPriceApiService() {
        service.get()
        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}

extension CurrentPriceServiceTest : CurrentPriceServiceDelegate {
    func currentPriceGetDidComplete(currentPrice: CurrentPrice, date: Date, fromCache: Bool) {
        self.success()
    }
    
    func currentPriceGetDidComplete(failure: ServiceFailureType) {
        self.failure(failure)
    }
    

    

}
