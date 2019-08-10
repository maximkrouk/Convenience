//
//  FallbackBuilder.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

@_functionBuilder
public struct FallbackBuiler {
    
    public typealias Closure = () -> Block
    public typealias Block = () throws -> Void
    public static func buildBlock(_ items: Block...) -> Block {
        return {
            do {
                try items.forEach {
                    do { try $0() }
                    catch { throw error }
                }
            } catch { throw error }
        }
    }
    
}
