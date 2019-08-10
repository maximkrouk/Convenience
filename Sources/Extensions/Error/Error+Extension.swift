//
//  Error+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public extension Error {
    
    var bag: ErrorBag { (self as? ErrorBag).unwrap(default: ErrorBag([self])!) }
    
}

public extension Error {
    
    func collect(@CollectBuiler closure: CollectBuiler.Closure) -> AFResult<Void> { Convenience.collect(closure: closure) }
    
    func fallback(@FallbackBuiler closure: FallbackBuiler.Closure) -> AFResult<Void> { Convenience.fallback(closure: closure) }
    
}
