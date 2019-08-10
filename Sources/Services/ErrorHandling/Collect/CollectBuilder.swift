//
//  CollectBuilder.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

@_functionBuilder
public struct CollectBuiler {
    
    public typealias Closure = () -> Block
    public typealias Block = () throws -> Void
    public static func buildBlock(_ items: Block...) -> Block {
        return {
            var errors = Errors()
            items.forEach {
                do { try $0() }
                catch { errors.append(error) }
            }
            guard errors.isEmpty else { throw ErrorBag(errors)! }
        }
    }
    
}
