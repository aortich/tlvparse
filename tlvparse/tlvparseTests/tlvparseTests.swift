//
//  tlvparseTests.swift
//  tlvparseTests
//
//  Created by Alberto Ortiz on 4/15/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import XCTest
@testable import tlvparse

class tlvparseTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    /*TLVParser tests*/
    func testParse() {
        let parser = TLVParser()
        let testInputData = "9F1607746573746c6f6c"
        let result = parser.parseTags(testInputData)
        
        XCTAssertTrue(result != nil)
        XCTAssertTrue(Array(result!.keys)[0] == "Merchant Identifier")
        XCTAssertTrue(Array(result!.values)[0] == "testlol")
    }
    
}
