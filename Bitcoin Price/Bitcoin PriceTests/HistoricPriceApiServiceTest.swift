//
//  historicPriceApiServiceTest.swift
//  Bitcoin PriceTests
//
//  Created by Faizal on 8/26/19.
//  Copyright © 2019 Faizal. All rights reserved.


import XCTest
@testable import Bitcoin_Price

class HistoricPriceApiServiceTest: ApiServiceTest {

    private let service = HistoricPriceApiService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        
    }

    // MARK: - Test

    func testGetWeekHistoricPriceApiService() {
        get(reference: .week)
    }

    func testGetMonthHistoricPriceApiService() {
        get(reference: .month)
    }

    func testGetYearHistoricPriceApiService() {
        get(reference: .year)
    }

    

    // MARK: - Private

    private func get(reference: ReferenceType) {
        service.get(reference: reference, success: { data in
            
            do {
                
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] {
                    
                    // check foreach dictionary if parseable
                    switch HistoricPrice.parseObject(dictionary: dictionary) {
                    case .failure( _):
                        self.failure(.server)
                    case .success( _):
                        self.success()
                        
                    }
                    
                }
                
                
            } catch {
                 self.failure(.server)
            }
 
        }, failure: { failure in
            self.failure(failure)
        })

        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}
