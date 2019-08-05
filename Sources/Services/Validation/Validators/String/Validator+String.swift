//
//  Validator+String.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public typealias StringValidator = Validator<String>

public extension Validator where Value == String {
    
    init(regex: Regex, failureDescription: String? = nil) {
        self.init(condition: { value in
            regex.matches(value) ?
                .success(value) :
                .failure(PlainError(description: failureDescription.unwrap(default: "Regex match failed.")))
        })
    }
    
}

