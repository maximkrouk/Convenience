//
//  Validator+String.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public typealias StringValidator = Validator<String>

public extension Validator where Value == String {
    
    /// Creates a new instance of `Validator<String>`.
    ///
    /// - Parameter regex: Used to generate a validation condition.
    /// - Parameter failureDescription: Description of the failure. Pass nothing or nil to use default: "Regex match failed."
    init(regex: Regex, failureDescription: String? = nil) {
        self.init {
            guard let description = failureDescription else { return regex.match($0) }
            return regex.match($0).mapError { _ in PlainError(description) }
        }
    }
    
    /// Creates a new instance of `Validator<String>`.
    ///
    /// - Parameter characterSet: Used to generate a validation condition.
    /// - Parameter failureDescription: Description of the failure. Pass nothing or nil to use default: "Regex match failed."
    init(only characterSet: CharacterSet, failureDescription: String? = nil) {
        self.init {
            characterSet.isSuperset(of: .init(charactersIn: $0)) ?
                .success($0) :
                .failure(PlainError(failureDescription ?? "String contains restricted characters"))
        }
    }
    
    /// Creates a new instance of `Validator<String>`.
    ///
    /// - Parameter characterSet: Used to generate a validation condition.
    /// - Parameter failureDescription: Description of the failure. Pass nothing or nil to use default: "Regex match failed."
    init(restrict characterSet: CharacterSet, failureDescription: String? = nil) {
        self.init {
            characterSet.inverted.isSuperset(of: .init(charactersIn: $0)) ?
                .success($0) :
                .failure(PlainError(failureDescription ?? "String contains restricted characters"))
        }
    }
    
}

