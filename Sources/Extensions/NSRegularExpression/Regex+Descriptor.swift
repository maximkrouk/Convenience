//
//  Regex+Descriptor.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/7/19.
//

import Foundation

public extension Regex {
    
    struct Descriptor {
        var regex: Regex
        private var error: Error?
        
        public init(regex: Regex, error: Error? = nil) {
            self.regex = regex
            self.error = error
        }
        
        var description: Error {
            let title = "Passed value"
            switch regex.pattern {
            case Regex.empty(true).pattern:
                return error.unwrap(default: PlainError("\(title) should be empty"))
            case Regex.empty(false).pattern:
                return error.unwrap(default: PlainError("\(title) should not be empty"))
            case Regex.letters(allowSpaces: false).pattern:
                return error.unwrap(default: PlainError("\(title) should contain latin letters only"))
            case Regex.digits(allowSpaces: false).pattern:
                return error.unwrap(default: PlainError("\(title) should contain digits only"))
            default:
                return error.unwrap(default: PlainError("reg not match"))
            }
        }
    }
    
    
}
