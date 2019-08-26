//
//  HistoricPriceApiServiceTest.swift
//  BitcoinPriceTests
//
//  Created by Faizal on 24/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import XCTest
@testable import BitcoinPrice

class HistoricPriceApiServiceTest: ApiServiceTest {

    private let service = HistoricPriceApiService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
    }

    // MARK: - Test

    func testGetWeekMarkePriceApiService() {
        get(reference: .week)
    }

    func testGetMonthMarkePriceApiService() {
        get(reference: .month)
    }

    func testGetYearMarkePriceApiService() {
        get(reference: .year)
    }

    func testGetAllMarkePriceApiService() {
        get(reference: .all)
    }

    // MARK: - Private

    private func get(reference: ReferenceType) {
        service.get(reference: reference, success: { data in
            do {
                _ = try JSONDecoder().decode(historicPrice.self, from: data)
                self.success()
            } catch {
                self.failure(.server)
            }
        }, failure: { failure in
            self.failure(failure)
        })

        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}
