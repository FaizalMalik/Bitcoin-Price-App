//
//  ViewControllerUITests.swift
//  BitcoinPriceUITests
//
//  Created by Faizal on 24/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
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
        XCUIApplication().buttons["allButton"].tap()
    }

}
