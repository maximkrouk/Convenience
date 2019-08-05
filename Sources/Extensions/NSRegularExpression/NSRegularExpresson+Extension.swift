//
//  NSRegularExpresson+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

public typealias Regex = NSRegularExpression

public extension Regex {
    
    convenience init(_ pattern: String, options: Options = []) {
        do {
            try self.init(pattern: pattern, options: options)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
    
}

public extension Regex {
    
    static var color: Regex { "#{0,1}[0-9A-F]{6}".regex(.caseInsensitive) }
    
}
