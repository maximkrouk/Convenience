//
//  Storage+Manager.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/3/19.
//

import Foundation

public extension Storage {
    
    class Provider<T: BinaryConvertable>: StorageProvider {
        public typealias Value = T
        
        private let manager: StorageManager
        
        public init(storageManager: StorageManager) {
            self.manager = storageManager
        }

        // MARK: - Deprecated getters and setters
        @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
        public func get<Key: Hashable>(forKey key: Key) -> Value? {
            guard let data = manager.data(forKey: key).value else { return nil }
            return Value(from: data)
        }

        @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
        @discardableResult
        public func set<Key: Hashable>(_ value: Value?, forKey key: Key) -> AFResult<Void> {
            guard let data = value?.data else { return manager.delete(key: key) }
            return manager.save(data: data, forKey: key)
        }
        
        @available(*, deprecated, message: "Use delete(for:) method instead.")
        @discardableResult
        public func delete<Key: Hashable>(forKey key: Key) -> AFResult<Void> { manager.delete(key: key) }
    }
    
}
