//
//  Cast.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/26/19.
//

import Foundation

public func usnafeCast<T>(_ object: Any, to type: T.Type) -> T! { cast(object, to: type) }

public func cast<T>(_ object: Any, to type: T.Type = T.self, default defaultValue: @autoclosure () -> T) -> T {
    cast(object, to: type).unwrap(default: defaultValue())
}

public func cast<T>(_ object: Any, to type: T.Type) -> T? { object as? T }
