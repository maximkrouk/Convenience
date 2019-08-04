//
//  Bool+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

extension Bool {
    var cfBool: CFBoolean { self ? kCFBooleanTrue : kCFBooleanFalse }
}
