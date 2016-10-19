//
//  FIRUser.swift
//  FirebaseMock
//
//  Created by Colm Du Ve on 18/10/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import Foundation
import FirebaseAuth

class FIRUserMock: FIRUser {
    var mockEmail: String
    var mockUid: String
    
    init?(email: String, uid: String) {
        guard email != "", uid != "" else { return nil }
        
        mockEmail = email
        mockUid = uid
    }
    
    /** @property uid
     @brief The provider's user ID for the user.
     */
    override public var uid: String {
        get {
            return mockUid
        }
    }
    
    
    /** @property displayName
     @brief The name of the user.
     */
    override public var displayName: String? {
        get {
            // TODO: Implement
            return nil
        }
    }
    
    
    /** @property photoURL
     @brief The URL of the user's profile photo.
     */
    override public var photoURL: URL? {
        get {
            // TODO: Implement
            return nil
        }
    }
    
    
    /** @property email
     @brief The user's email address.
     */
    override public var email: String?  {
        get {
            return mockEmail
        }
    }

}
