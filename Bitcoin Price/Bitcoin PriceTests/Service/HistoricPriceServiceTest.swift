//
//  HistoricPriceServiceTest
//  Bitcoin PriceTests
//
//  Created by Faizal on 8/26/19.
//  Copyright © 2019 Faizal. All rights reserved.


import XCTest
@testable import Bitcoin_Price

class HistoricPriceServiceTest: ApiServiceTest {

    private let service = HistoricPriceService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
          service.delegate = self
    }

    // MARK: - Test

    func testGetWeekHistoricPriceService() {
        get(reference: .week)
    }

    func testGetMonthHistoricPriceService() {
        get(reference: .month)
    }

    func testGetYearHistoricPriceService() {
        get(reference: .year)
    }

   

    // MARK: - Private

    private func get(reference: ReferenceType) {
        
        service.get(reference: reference)
        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}

extension HistoricPriceServiceTest: HistoricPriceServiceDelegate {

    func historicPriceGetDidComplete(historicPrice: HistoricPrice){
        self.success()
    }
    func historicPriceGetDidComplete(failure: ServiceFailureType){
        self.failure(failure)
    }


}
