//
//  CFString+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation
import Security

public extension CFString {
    var string: String { self as String }
}

public extension CFBoolean {
    var bool: Bool { self == kCFBooleanTrue }
}

extension Bool {
    var cfBoolean: CFBoolean { self ? kCFBooleanTrue : kCFBooleanFalse }
}
