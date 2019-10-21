//
//  Collect.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

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
/// collect {
///     someThrowable
///     someThrowable
///     someThrowable
/// }
/// ```
/// You may also use it as an Error's static method.
/// ```
/// Error.collect {
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
public func collect(@CollectBuiler closure: CollectBuiler.Closure) -> Result<Void> {
    do { return .success(try closure()()) }
    catch { return .failure(error) }
}
