//
//  FIRDataSnapshotMock.swift
//  FirebaseMock
//
//  Created by Colm Du Ve on 18/10/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FIRDataSnapshotMock: FIRDataSnapshot {
    
    var mockRef: FIRDatabaseReference
    var mockData: Any?
    
    init?(ref: FIRDatabaseReference, data: Any?) {
        mockRef = ref
        mockData = data
    }
    
    /** @name Navigating and inspecting a snapshot */
    
    /**
     * Gets a FIRDataSnapshot for the location at the specified relative path.
     * The relative path can either be a simple child key (e.g. 'fred')
     * or a deeper slash-separated path (e.g. 'fred/name/first'). If the child
     * location has no data, an empty FIRDataSnapshot is returned.
     *
     * @param childPathString A relative path to the location of child data.
     * @return The FIRDataSnapshot for the child location.
     */
    override func childSnapshot(forPath childPathString: String) -> FIRDataSnapshot {
        guard let mockData = mockData as? Dictionary<String, Any>,
            let ref = mockRef.child(childPathString) as? FIRDatabaseReferenceMock,
            let snapshot = FIRDataSnapshotMock(ref: ref, data: mockData[childPathString]) else {
            return FIRDataSnapshot()
        }
        return snapshot
        
    }
    
    
    /**
     * Return YES if the specified child exists.
     *
     * @param childPathString A relative path to the location of a potential child.
     * @return YES if data exists at the specified childPathString, else NO.
     */
    override func hasChild(_ childPathString: String) -> Bool {
        guard let mockData = mockData as? Dictionary<String, Any> else { return false }
        return mockData[childPathString] != nil
    }
    
    
    /**
     * Return YES if the DataSnapshot has any children.
     *
     * @return YES if this snapshot has any children, else NO.
     */
    override func hasChildren() -> Bool {
        return childrenCount > 0
    }
    
    
    /**
     * Return YES if the DataSnapshot contains a non-null value.
     *
     * @return YES if this snapshot contains a non-null value, else NO.
     */
    override func exists() -> Bool {
        return mockData != nil
    }
    
    
    /** @name Data export */
    
    /**
     * Returns the raw value at this location, coupled with any metadata, such as priority.
     *
     * Priorities, where they exist, are accessible under the ".priority" key in instances of NSDictionary.
     * For leaf locations with priorities, the value will be under the ".value" key.
     */
    override func valueInExportFormat() -> Any? {
        // TODO: Implement
        return nil
    }
    
    
    /** @name Properties */
    
    /**
     * Returns the contents of this data snapshot as native types.
     *
     * Data types returned:
     * * NSDictionary
     * * NSArray
     * * NSNumber (also includes booleans)
     * * NSString
     *
     * @return The data as a native object.
     */
    override var value: Any? {
        get {
            return mockData
        }
    }
    
    
    /**
     * Gets the number of children for this DataSnapshot.
     *
     * @return An integer indicating the number of children.
     */
    override var childrenCount: UInt {
        get {
            switch mockData {
            case is Array<Any>:
                return UInt((mockData as! Array<Any>).count)
            case is Dictionary<String,Any>:
                return UInt((mockData as! Dictionary<String,Any>).count)
            default:
                return 0
            }
        }
    }
    
    
    /**
     * Gets a FIRDatabaseReference for the location that this data came from
     *
     * @return A FIRDatabaseReference instance for the location of this data
     */
    override var ref: FIRDatabaseReference {
        get {
            return mockRef
        }
    }
    
    
    /**
     * The key of the location that generated this FIRDataSnapshot.
     *
     * @return An NSString containing the key for the location of this FIRDataSnapshot.
     */
    override var key: String {
        get {
            return mockRef.key
        }
    }
    
    
    /**
     * An iterator for snapshots of the child nodes in this snapshot.
     * You can use the native for..in syntax:
     *
     * for (FIRDataSnapshot* child in snapshot.children) {
     *     ...
     * }
     *
     * @return An NSEnumerator of the children
     */
    override var children: NSEnumerator {
        get {
            switch mockData {
            case is Array<Any>:
                return (mockData as! NSArray).objectEnumerator()
            case is Dictionary<String,Any>:
                return (mockData as! NSDictionary).objectEnumerator()
            default:
                return NSEnumerator()
            }
        }
    }
    
    
    /**
     * The priority of the data in this FIRDataSnapshot.
     *
     * @return The priority as a string, or nil if no priority was set.
     */
    override var priority: Any? {
        get {
            // TODO: Implement
            return nil
        }
    }
    
}
