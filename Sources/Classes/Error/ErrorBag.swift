//
//  ErrorBag.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public struct ErrorBag: Error {
    
    /// Array of errors
    ///
    /// Never empty.
    public let contents: Errors
    
    /// Custom desctiption (overrides default description)
    private var description: String?
    
    /// String with errors' descriptions
    ///
    /// Returns initial description if it was specified, othrewise returns descriptions
    /// of included errors, redused into one string.
    ///
    /// Exabple of default (not initial) description:
    /// ```
    /// """
    /// First error's localized description.
    /// \(all other descriptions)
    /// Last error's localized descriontion.
    /// """
    /// ```
    var localizedDescription: String {
        description.unwrap(default: contents.reduce("", { "\($0)\($1)\n" }))
    }
    
    /// Creates a new ErrorBag instance.
    ///
    /// - Parameter error: First error.
    /// - Parameter errors: Errors, optionally passed to the initializer.
    /// - Parameter description: Initial description, used as a custom localizedDescription, see it's comments for more info.
    public init(error: Error, _ errors: Error..., description: String? = nil) {
        self.init([error] + errors, description: description)!
    }
    
    /// Creates a new ErrorBag instance.
    ///
    /// Fails if passed errors array contain no errors. It must not be empty.
    ///
    /// - Parameter errors: Errors, passed to the initializer.
    /// - Parameter description: Initial description, used as a custom localizedDescription, see it's comments for more info.
    public init?(_ errors: Errors, description: String? = nil) {
        guard !errors.isEmpty else { return nil }
        self.contents = errors
        self.description = description
    }
    
}
