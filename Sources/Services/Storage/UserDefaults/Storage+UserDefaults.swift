//
//  Storage+UserDefaults.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage {
    typealias UD = UserDefaults
    
    final class UserDefaults: StorageManager {
        private var standard: Foundation.UserDefaults { Foundation.UserDefaults.standard }
        
        public static let `default` = UserDefaults()
        
        /// Returns `UserDefaults.default.data` instance.
        public static var data: Provider<Data> { UserDefaults.default.data }
        
        /// Returns `UserDefaults.default.bool` instance.
        public static var bool: Provider<Bool> { UserDefaults.default.bool }
        
        /// Returns `UserDefaults.default.string` instance.
        public static var string: Provider<String> { UserDefaults.default.string }
        
        /// Use this instance to store and access Data keychain items.
        private(set) public var data: Provider<Data>!
        
        /// Use this instance to store and access Bool keychain items.
        private(set) public var bool: Provider<Bool>!
        
        /// Use this instance to store and access String keychain items.
        private (set) public var string: Provider<String>!
        
        public init() {
            self.data   = .init(storageProvider: self)
            self.bool   = .init(storageProvider: self)
            self.string = .init(storageProvider: self)
        }
        
        public func data(forKey key: String) -> AFResult<Data> {
            guard let data = standard.data(forKey: key) else {
                return .failure(PlainError("No data found for key [\(key)]."))
            }
            return .success(data)
        }
        
        public func save(data: Data, forKey key: String) -> AFResult<Void> {
            standard.set(data, forKey: key)
            return .success(())
        }
        
        public func delete(key: String) -> AFResult<Void> {
            standard.set(nil, forKey: key)
            return .success(())
        }
    }
    
}
