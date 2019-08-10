//
//  Collect.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/10/19.
//

import Foundation

public struct Collect {
    let result: AFResult<Void>
    init(@Fallback.Builer closure: Fallback.Builer.Closure) {
        do { result = .success(try closure()()) }
        catch { result = .failure(error) }
    }
}

public extension Collect {
    @_functionBuilder
    struct Builer {
        typealias Closure = () -> Block
        typealias Block = () throws -> Void
        static func buildBlock(_ items: Block...) -> Block {
            return {
                var errors = Errors()
                items.forEach {
                    do { try $0() }
                    catch { errors.append(error) }
                }
                guard errors.isEmpty else { throw ErrorBag(errors) }
            }
        }
    }
}
