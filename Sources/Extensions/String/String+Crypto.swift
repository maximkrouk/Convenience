//
//  String+Crypto.swift
//  Convenience
//
//  Created by Maxim Krouk on 9/2/19.
//

import CommonCrypto
import CryptoKit

public extension String {
    
    /// UNSTABLE
    private var sha1: String? {
        guard var data = data(using: .utf8) else { return nil }
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(&data, CC_LONG(data.count), &hash)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
    var sha256: String? {
        guard var data = data(using: .utf8) else { return nil }
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(&data, UInt32(data.count), &digest)
        return data.map { String(format:"%02x", $0) }.joined()
    }
    
    var md5: String? {
        guard var data = data(using: .utf8) else { return nil }
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(&data, CC_LONG(data.count), &hash)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
}
