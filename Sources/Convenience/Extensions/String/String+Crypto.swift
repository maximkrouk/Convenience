//
//  String+Crypto.swift
//  Convenience
//
//  Created by Maxim Krouk on 9/2/19.
//

import CommonCrypto

public extension String {
    
    @available(*, deprecated, message: "'md5' was deprecated in watchOS 6.0: This function is cryptographically broken and should not be used in security contexts. Clients should migrate to sha256 (or stronger).")
    var md5: String? {
        data(using: .ascii)?
            .md5?
            .map { String(format: "%02x", $0) }
            .joined()
    }
    
    var sha1: String? {
        data(using: .ascii)?
            .sha1?
            .map { String(format: "%02x", $0) }
            .joined()
    }
    
    var sha256: String? {
        data(using: .ascii)?
            .sha256?
            .map { String(format: "%02x", $0) }
            .joined()
    }
    
    var sha512: String? {
        data(using: .ascii)?
            .sha512?
            .map { String(format: "%02x", $0) }
            .joined()
    }
    
}

