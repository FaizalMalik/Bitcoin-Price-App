//
//  Bitcoin_PriceUITests.swift
//  Bitcoin PriceUITests
//
//  Created by Faizal on 8/26/19.
//  Copyright © 2019 Bruno Tortato Furtado. All rights reserved.
//

import XCTest

class ViewControllerUITests: XCTestCase {
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    // MARK: - Test
    
    func testViewControllerHeaderButton() {
        XCUIApplication().buttons["refreshButton"].tap()
    }
    
    func testViewControllerFooterButtons() {
        XCUIApplication().buttons["weekButton"].tap()
        XCUIApplication().buttons["monthButton"].tap()
        XCUIApplication().buttons["yearButton"].tap()
    }


}
