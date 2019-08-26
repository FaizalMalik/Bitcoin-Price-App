//
//  HistoricPriceServiceTest.swift
//  BitcoinPriceTests
//
//  Created by Faizal on 03/02/18.
//  Copyright © 2018 Faizal . All rights reserved.
//

import XCTest
@testable import BitcoinPrice

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

    func historicPriceGetDidComplete(historicPrice: historicPrice) {
        self.success()
    }

    func historicPriceGetDidComplete(failure: ServiceFailureType) {
        self.failure(failure)
    }

}
