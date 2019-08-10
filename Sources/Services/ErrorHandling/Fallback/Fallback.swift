//
//  Fallback.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public struct Fallback {
    let result: AFResult<Void>
    init(@Fallback.Builer closure: Fallback.Builer.Closure) {
        do { result = .success(try closure()()) }
        catch { result = .failure(error) }
    }
}

public extension Fallback {
    @_functionBuilder
    struct Builer {
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
}
