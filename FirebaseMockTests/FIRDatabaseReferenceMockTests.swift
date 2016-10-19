//
//  FirebaseMockTests.swift
//  FirebaseMockTests
//
//  Created by Colm Du Ve on 18/10/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import XCTest
@testable import FirebaseMock

class FIRDatabaseReferenceMockTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitialization() {
        let ref1 = FIRDatabaseReferenceMock(url: "https://test.firebaseio.com/")
        
        XCTAssertNotNil(ref1)
        XCTAssertEqual(ref1!.key, "/")
        
        let ref2 = FIRDatabaseReferenceMock(url: "https://test.firebaseio.com/myapp/")
        
        XCTAssertNotNil(ref2)
        XCTAssertEqual(ref2!.key, "myapp")
        
        let ref3 = FIRDatabaseReferenceMock(url: "https://test.firebaseio.com")
        
        XCTAssertNotNil(ref3)
        XCTAssertEqual(ref3!.key, "/")
        
        let ref4 = FIRDatabaseReferenceMock(url: "https://test.firebaseio.com/myapp")
        
        XCTAssertNotNil(ref4)
        XCTAssertEqual(ref4!.key, "myapp")
    }
    
}
