//
//  tlvparseUITests.swift
//  tlvparseUITests
//
//  Created by Alberto Ortiz on 4/15/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import XCTest

class tlvparseUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /*Popup ui test*/
    func testShowPopup() {
        app.launch()
        let tlv = app.textViews["tvTLV"]
        let button = app.buttons["parseButton"]
        
        button.tap()
        XCTAssertTrue(app.isDisplayingPopup)
    }
    
}

extension XCUIApplication {
    var isDisplayingPopup: Bool {
        return otherElements["popupTLV"].exists
    }
}
