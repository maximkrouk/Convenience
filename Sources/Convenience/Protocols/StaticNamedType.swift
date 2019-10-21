//
//  StaticNamedType.swift
//  ConvenientProtocols
//
//  Created by Maxim Krouk on 10/18/19.
//

public protocol StaticNamedType {
    
    static var name: String { get }
    
}

extension StaticNamedType {
    
    public static var name: String { "\(Self.self)" }
    
}
