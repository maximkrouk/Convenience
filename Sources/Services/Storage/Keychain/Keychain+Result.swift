//
//  Keychain+Result.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation
import Security

public extension Storage.Keychain {
    struct Result {
        /// Result code. Equal to noErr (0) if operation succseed.
        public var code: OSStatus
        
        /// Creates a new instance.
        ///
        /// - Parameter code: Result code, noErr (0) by default.
        public init(code: OSStatus = noErr) {
            self.code = code
        }
        
        public var isSuccess: Bool { code == noErr }
        public var afResult: AFResult<Void> { isSuccess ? .success(()) : .failure(Storage.Keychain.Error(code: code)) }
    }
}

