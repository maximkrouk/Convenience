//
//  Error+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public extension Error {
    
    var bag: ErrorBag { (self as? ErrorBag).unwrap(default: ErrorBag([self])) }
    
}
