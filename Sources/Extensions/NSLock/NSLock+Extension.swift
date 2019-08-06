//
//  NSLock+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/6/19.
//

import Foundation

public extension NSLock {
    
    /// Executes a code block in a closed lock.
    ///
    /// Locks self before executing closure and unlocks immediately after return.
    ///
    /// - Parameter closure: code block to execute.
    /// - Returns: closure's returned value.
    func execute<T>(closure: () -> T ) -> T {
        lock(); defer { unlock() }
        return closure()
    }
    
}
