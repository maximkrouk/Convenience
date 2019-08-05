//
//  String+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension String {
    
    var url: URL? { URL(string: self) }
    var nsString: NSString { NSString(string: self) }
    func regex(_ options: Regex.Options = []) -> Regex { Regex(self, options: options) }
    
}
