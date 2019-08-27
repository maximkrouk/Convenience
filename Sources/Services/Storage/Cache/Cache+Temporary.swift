//
//  Cache+Temporary.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage.Cache {
    
    final class Temporary: StorageManager {
        private let storage = NSCache<NSString, Item>()
        
        public func data<Key: Hashable>(forKey key: Key) -> AFResult<Data> {
            guard let data = storage.object(forKey: key.hashValue.string.nsString)?.content else {
                return .failure(PlainError("No data found for key: [\(key)]"))
            }
            return .success(data)
        }
                
        public func save<Key: Hashable>(data: Data, forKey key: Key) -> AFResult<Void> {
            storage.setObject(.init(content: data), forKey: key.hashValue.string.nsString)
            return .success(())
        }
                
        public func delete<Key: Hashable>(key: Key) -> AFResult<Void> {
            storage.removeObject(forKey: key.hashValue.string.nsString)
            return .success(())
        }
        
        public func clear() -> AFResult<Void> {
            storage.removeAllObjects()
            return .success(())
        }
    }
    
}
