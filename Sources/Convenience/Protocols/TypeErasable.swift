//
//  TypeErasable.swift
//  ConvenientProtocols
//
//  Created by Maxim Krouk on 10/18/19.
//

public protocol TypeErasable {
    
    associatedtype Erased
    var any: Erased { get }
    
}
