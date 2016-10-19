//
//  FIRDatabaseReferenceMock.swift
//  FirebaseMock
//
//  Created by Colm Du Ve on 18/10/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FIRDatabaseReferenceMock: FIRDatabaseReference {
    fileprivate var mockUrl: String
    
    init?(url: String) {
        guard url != "" else { return nil }
        mockUrl = url
    }
    
    /**
     * The key of the location that generated this FIRDataSnapshot.
     *
     * @return An NSString containing the key for the location of this FIRDataSnapshot.
     */
    override var key: String {
        get {
            guard var key = mockUrl.components(separatedBy: "/").last else { return "" }
            if key == "" {
                key = mockUrl.components(separatedBy: "/").dropLast().last!
            }
            if key.contains("firebaseio.com") { return "/" }
            return key
        }
    }
}
