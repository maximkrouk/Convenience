//
//  Fallback.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

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
/// fallback {
///     someThrowable
///     someThrowable
///     someThrowable
/// }
/// ```
/// You may also use it as an Error's static method.
/// ```
/// Error.fallback {
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
public func fallback(@FallbackBuiler closure: FallbackBuiler.Closure) -> AFResult<Void> {
    do { return .success(try closure()()) }
    catch { return .failure(error) }
}
