//
//  StringProtocol+Subscript.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

extension LosslessStringConvertible {
    
    /// Returns an instance of String initialized with self.
    public var string: String { .init(self) }
    
}
