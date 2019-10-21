//
//  File 2.swift
//  
//
//  Created by Maxim Krouk on 10/21/19.
//

import Foundation

public protocol ConvenientEncoder {
    
    func encode<T>(_ value: T) throws -> Data where T : Encodable
    
}
