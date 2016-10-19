//
//  FIRDataSnapshotMockTests.swift
//  FirebaseMock
//
//  Created by Colm Du Ve on 18/10/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import XCTest
@testable import FirebaseMock

class FIRDataSnapshotMockTests: XCTestCase {
    
    var ref: FIRDatabaseReferenceMock!
    
    override func setUp() {
        super.setUp()
        
        ref = FIRDatabaseReferenceMock(url: "https://test.firebaseio.com/myapp/")
        XCTAssertNotNil(ref)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitWithNil() {
        let snapshot = FIRDataSnapshotMock(ref: ref, data: nil)
        
        XCTAssertNotNil(snapshot)
        XCTAssertFalse(snapshot!.exists())
        XCTAssertEqual(snapshot!.key, "myapp")
    }
    
    func testInitWithBool() {
        let snapshot = FIRDataSnapshotMock(ref: ref, data: true)
        
        XCTAssertNotNil(snapshot)
        XCTAssertTrue(snapshot!.exists())
        XCTAssertEqual(snapshot!.key, "myapp")
        XCTAssertEqual(snapshot!.value as! Bool, true)
    }
    
    func testInitWithInt() {
        let snapshot = FIRDataSnapshotMock(ref: ref, data: 10)
        
        XCTAssertNotNil(snapshot)
        XCTAssertTrue(snapshot!.exists())
        XCTAssertEqual(snapshot!.key, "myapp")
        XCTAssertEqual(snapshot!.value as! Int, 10)
    }
    
    func testInitWithArray() {
        let array = ["Element 1", "Element 2", "Element 3"]
        let snapshot = FIRDataSnapshotMock(ref: ref, data: array)
        
        XCTAssertNotNil(snapshot)
        XCTAssertTrue(snapshot!.exists())
        XCTAssertEqual(snapshot!.key, "myapp")
        XCTAssertEqual(snapshot!.value as! Array<String>, array)
        XCTAssertEqual(snapshot!.hasChildren(), true)
        XCTAssertEqual(snapshot!.childrenCount, 3)
        
        var index = 0
        for child in snapshot!.children {
            XCTAssertEqual(child as! String, array[index])
            index += 1
        }
    }
    
    func testInitWithDictionary() {
        var dict: [String : Any] = ["key1": "val1", "key2": 3, "key3": true] as [String : Any]
        let childDict: [String : Any] = ["key1": "val1", "key2": 3, "key3": true]
        dict["child"] = childDict
        
        let snapshot = FIRDataSnapshotMock(ref: ref, data: dict)
        
        XCTAssertNotNil(snapshot)
        XCTAssertTrue(snapshot!.exists())
        XCTAssertEqual(snapshot!.key, "myapp")
        XCTAssertEqual(snapshot!.hasChildren(), true)
        XCTAssertEqual(snapshot!.childrenCount, 4)
        
        for child in snapshot!.children {
            print(child)
            switch child {
            case is Bool:
                XCTAssertEqual(child as! Bool, dict["key3"] as! Bool)
            case is Int:
                XCTAssertEqual(child as! Int, dict["key2"] as! Int)
            case is String:
                XCTAssertEqual(child as! String, dict["key1"] as! String)
            case is Dictionary<String,Any>:
                let valueDict = child as! [String: Any]
                XCTAssertEqual(valueDict["key1"] as! String, childDict["key1"] as! String)
                XCTAssertEqual(valueDict["key2"] as! Int, childDict["key2"] as! Int)
                XCTAssertEqual(valueDict["key3"] as! Bool, childDict["key3"] as! Bool)
            default:
                break
            }
        }
    }
    
}
