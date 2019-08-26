//
//  HistoricPriceServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 03/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

class HistoricPriceServiceTest: ApiServiceTest {

    private let service = HistoricPriceService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        service.delegate = self
    }

    // MARK: - Test

    func testGetWeekMarkePriceService() {
        get(reference: .week)
    }

    func testGetMonthMarkePriceService() {
        get(reference: .month)
    }

    func testGetYearMarkePriceService() {
        get(reference: .year)
    }

    func testGetAllMarkePriceService() {
        get(reference: .all)
    }

    // MARK: - Private

    private func get(reference: ReferenceType) {
        service.get(reference: reference)
        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}

extension HistoricPriceServiceTest: HistoricPriceServiceDelegate {

    func marketPriceGetDidComplete(marketPrice: MarketPrice) {
        self.success()
    }

    func marketPriceGetDidComplete(failure: ServiceFailureType) {
        self.failure(failure)
    }

}
