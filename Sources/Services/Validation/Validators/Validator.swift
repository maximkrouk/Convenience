//
//  Validator.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/6/19.
//

import Foundation

public struct Validator<Value>: AnyValidator {
    
    public typealias Result = AFResult<Value>
    public typealias Condition = (Value) -> Result
    
    /// Validation condition.
    private var condition: Condition
    
    /// Creates a new validator instance with specified condition.
    ///
    /// - Parameter condition: validation condition.
    public init(condition: @escaping Condition) {
        self.condition = condition
    }
    
    /// Validates if value fits the condition.
    ///
    /// - Parameter value: object to validate.
    /// - Returns: .success(Value) if validation succeed, .failure(Error) otherwise.
    public func validate(_ value: Value) -> Result { condition(value) }
    
}
