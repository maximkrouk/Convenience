//
//  Bool+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

extension Bool {
    
    /// Returns data, initialized with [0] if self is false, or with [1] otherwise.
    var data: Data { Data([self ? 1 : 0]) }
    
}
