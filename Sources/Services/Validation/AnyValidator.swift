//
//  AnyValidator.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/6/19.
//

import Foundation

public protocol AnyValidator {
    
    associatedtype Result
    associatedtype Value
    
    func validate(_ value: Value) -> Result
    
}
