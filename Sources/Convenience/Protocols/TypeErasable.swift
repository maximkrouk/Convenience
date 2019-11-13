//
//  TypeErasable.swift
//  ConvenientProtocols
//
//  Created by Maxim Krouk on 10/18/19.
//

public protocol ErasableType {
    
    associatedtype Erased
    var erased: Erased { get }
    
}
