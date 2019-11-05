//
//  String+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension String {
    
    /// Returns URL initialized with self.
    var url: URL? { URL(string: self) }

    /// Returns NSString initialized with self.
    var nsString: NSString { NSString(string: self) }
    
    /// Data using UTF-8 encoding.
    func data() -> Data? { data(using: .utf8) }
    
    /// Returns Regex initialized with self and options.
    func regex(_ options: Regex.Options = []) -> Regex { Regex(self, options: options) }
    
}
