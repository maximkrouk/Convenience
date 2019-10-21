//
//  File.swift
//  
//
//  Created by Maxim Krouk on 10/21/19.
//

import Foundation

extension CharacterSet: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(charactersIn: value)
    }
    
}

public extension CharacterSet {
    
    var binaryDigits: CharacterSet { "01" }
    
    var hexDigits: CharacterSet { CharacterSet.decimalDigits.union("AaBbCcDdEeFf") }
    
}
