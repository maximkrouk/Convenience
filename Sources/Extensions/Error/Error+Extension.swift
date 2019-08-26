//
//  Error+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public typealias Errors = [Error]

public extension Error {
    
    /// Returns self as ErrorBag or an Error bag, initialized with self if cast failed.
    var bag: ErrorBag { cast(self, to: ErrorBag.self, default: .init(errors: self)) }
    
}

public extension Error {
    
    /// Produces a result from a multiple throwing functions with errors collected.
    ///
    /// Uses multiline a closure to build a result.
    /// The .success case will always contain nothing.
    /// The .failure case will always contain an error, which is always an ErrorBag
    /// so use
    /// ```
    /// error.bag.contents
    /// ```
    /// to get an array of thrown errors.
    ///
    /// Usage example:
    /// ```
    /// func someThrowable() throws {}
    /// ```
    /// ```
    /// Error.collect {
    ///     someThrowable
    ///     someThrowable
    ///     someThrowable
    /// }
    /// ```
    /// You may also use it as a function.
    /// ```
    /// collect {
    ///     someThrowable
    ///     someThrowable
    ///     someThrowable
    /// }
    /// ```
    ///
    /// - Note: throwing function must have the following signature:
    /// ```
    /// () throws -> Void
    /// ```
    ///
    /// - Parameter closure: Multiline closure of throwing functions.
    /// - Returns: .success if no errors sere thrown, otherwise .failure(errorBag).
    static func collect(@CollectBuiler closure: CollectBuiler.Closure) -> AFResult<Void> { Convenience.collect(closure: closure) }
    
    /// Produces a result from a multiple throwing functions.
    ///
    /// Uses multiline a closure to build a result.
    /// The .success case will always contain nothing.
    /// The .failure case will always contain the first thrown error.
    ///
    /// Usage example:
    /// ```
    /// func someThrowable() throws {}
    /// ```
    /// ```
    /// Error.fallback {
    ///     someThrowable
    ///     someThrowable
    ///     someThrowable
    /// }
    /// ```
    /// You may also use it as a function.
    /// ```
    /// fallback {
    ///     someThrowable
    ///     someThrowable
    ///     someThrowable
    /// }
    /// ```
    ///
    /// - Note: throwing function must have the following signature:
    /// ```
    /// () throws -> Void
    /// ```
    ///
    /// - Parameter closure: Multiline closure of throwing functions.
    /// - Returns: .success if no errors sere thrown, otherwise .failure(firstError).
    static func fallback(@FallbackBuiler closure: FallbackBuiler.Closure) -> AFResult<Void> { Convenience.fallback(closure: closure) }
    
}
