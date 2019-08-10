//
//  Fallback.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public func fallback(@Fallback.Builer closure: Fallback.Builer.Closure) -> AFResult<Void> {
    do { return .success(try closure()()) }
    catch { return .failure(error) }
}

public struct FallbackBuiler {
    typealias Closure = () -> Block
    typealias Block = () throws -> Void
    static func buildBlock(_ items: Block...) -> Block {
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
