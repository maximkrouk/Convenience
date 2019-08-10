//
//  Fallback.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public func fallback(@FallbackBuiler closure: FallbackBuiler.Closure) -> AFResult<Void> {
    do { return .success(try closure()()) }
    catch { return .failure(error) }
}

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
