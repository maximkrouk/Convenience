//
//  ErrorBag.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public struct ErrorBag: Error {
    
    private (set) public var contents: Errors
    private var description: String?
    var localizedDescription: String {
        description.unwrap(default: contents.reduce("", { "\($0)\($1)\n" }))
    }
    
    public init(error: Error, _ errors: Error..., description: String? = nil) {
        self.init(errors, description: description)
    }
    
    public init(_ errors: Errors, description: String? = nil) {
        self.contents = errors
        self.description = description
    }
    
}
