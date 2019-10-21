//
//  PlainError.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/3/19.
//

import Foundation

public struct PlainError: Error {
    
    var localizedDescription: String
    public init(_ description: String) {
        self.init(description: description)
    }
    
    public init(description: String) {
        localizedDescription = description
    }
    
}

extension PlainError: ExpressibleByStringLiteral {
    
    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String) {
        localizedDescription = value
    }
    
}
