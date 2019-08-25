//
//  Modification.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/25/19.
//

import Foundation

/// Modifies the instance and returns the result.
///
/// If an object is an instance of a reference type, than the object will be modified and than returned.
/// Otherwise the copy of an object will be created, modified and returned.
///
/// - Parameter object: The instance.
/// - Parameter closure: Modification.
/// - Returns: modified object.
public func modification<T>(of object: T, closure: (inout T) -> Void) -> T {
    var object = object
    closure(&object)
    return object
}

/// Performs specified modification on any instance.
///
/// - Parameter object: The instance.
/// - Parameter closure: Modification.
public func modify<T>(_ object: inout T, closure: (inout T) -> Void) { closure(&object) }

/// Performs specified modification on the instance of a class.
///
/// - Parameter object: Instance of a class.
/// - Parameter closure: Modification.
public func modify<T: AnyObject>(_ object: T, closure: (T) -> Void) { closure(object) }
