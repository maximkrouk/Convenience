//
//  Data+Crypto.swift
//  Convenience
//
//  Created by Maxim Krouk on 10/22/19.
//

import Foundation
import CommonCrypto

public extension Data {
    
    @available(*, deprecated, message: "'md5' was deprecated in watchOS 6.0: This function is cryptographically broken and should not be used in security contexts. Clients should migrate to sha256 (or stronger).")
    var md5: Data? {
        var data = self
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(&data, CC_LONG(data.count), &digest)
        return Data(digest)
    }
    
    var sha1: Data? {
        var data = self
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(&data, CC_LONG(data.count), &digest)
        return Data(digest)
    }
    
    var sha256: Data? {
        var data = self
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(&data, UInt32(data.count), &digest)
        return Data(digest)
    }
    
    var sha512: Data? {
        var data = self
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        CC_SHA256(&data, UInt32(data.count), &digest)
        return Data(digest)
    }
    
}
