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
        self.init(condition: { value in
            regex.matches(value) ?
                .success(value) :
                .failure(PlainError(description: failureDescription.unwrap(default: "Regex match failed.")))
        })
    }
    
}

