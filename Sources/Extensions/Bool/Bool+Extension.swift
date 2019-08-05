//
//  Bool+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

extension Bool {
    var data: Data { Data([self ? 1 : 0]) }
}
