//
//  File.swift
//  
//
//  Created by Maxim Krouk on 10/21/19.
//

import Foundation

public protocol ConvenientDecoder {
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    
}
