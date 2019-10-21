//
//  File.swift
//  
//
//  Created by Maxim Krouk on 10/21/19.
//

import Foundation

extension Encodable {
    
    public func encode(using encoder: ConvenientEncoder = JSONEncoder()) throws -> Data {
        try encoder.encode(self)
    }
    
}

extension Decodable {
    
    public func decode(from data: Data, using decoder: ConvenientDecoder = JSONDecoder()) throws -> Self {
        try decoder.decode(Self.self, from: data)
    }
    
}
