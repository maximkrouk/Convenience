//
//  Optional+Unwrap.swift
//  Combine-Try
//
//  Created by Maxim Krouk on 7/31/19.
//  Copyright © 2019 Maxim Krouk. All rights reserved.
//

import Foundation

public extension Optional {
    
    /// Sets object to nil.
    mutating func release() { self = nil }
    
    var isNil: Bool {
        guard let _ = self else { return true }
        return false
    }
    
    /// Safely casts the caller to specified type.
    ///
    /// - Parameter default: the type to which the caller will be casted to.
    /// - Returns: casted caller or default if the caller was nil or not castable.
    func cast<T>(default defaultValue: @autoclosure () -> T) -> T { self as? T ?? defaultValue() }
    
    /// Unwraps optional value or default value unwrap failed.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped: StringProtocol {
    
    /// Safely unwraps StringProtocol object.
    ///
    /// - Parameter default: default StringProtocol object to return if the caller is nil. "" if not specifed.
    /// - Returns: unwrapped StringProtocol object or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped = { "" }()) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped == Bool {
    
    /// Safely unwraps Bool value.
    ///
    /// - Parameter default: default value to return if the caller is nil. False if not specified.
    /// - Returns: unwrapped value or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped = { false }()) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped == Data {
    
    /// Safely unwraps Data.
    ///
    /// - Parameter default: default data to return if the caller is nil. Data() if not specified.
    /// - Returns: unwrapped data or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped = { Data() }()) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped == Int {
    
    /// Safely unwraps Int value.
    ///
    /// - Parameter default: default value to return if the caller is nil. Int() if not specifed.
    /// - Returns: unwrapped value or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped = { Int() }()) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped == CGFloat {
    
    /// Safely unwraps CGFloat value.
    ///
    /// - Parameter default: default value to return if the caller is nil. CGFloat() if not specifed.
    /// - Returns: unwrapped value or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped = { CGFloat() }()) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped == Double {
    
    /// Safely unwraps Double value.
    ///
    /// - Parameter default: default value to return if the caller is nil. Double() if not specifed.
    /// - Returns: unwrapped value or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> Wrapped = { Double() }()) -> Wrapped { self ?? defaultValue() }
    
}

public extension Optional where Wrapped: Sequence {
    
    /// Safely unwraps Sequence object.
    ///
    /// - Parameter default: default sequence object to return if the caller is nil. Empty array if not specified.
    /// - Returns: unwrapped sequence or default if the caller was nil.
    func unwrap(default defaultValue: @autoclosure () -> [Wrapped.Element] = { [Wrapped.Element]() }()) -> [Wrapped.Element] { self as? [Wrapped.Element] ?? defaultValue() }
    
}
