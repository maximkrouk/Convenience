//
//  Cache+Temporary.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage.Cache {
    
    class Temporary: StorageManager {
        private let storage = NSCache<NSString, Item>()
        
        public func data(forKey key: String) -> AFResult<Data> {
            guard let data = storage.object(forKey: key.nsString)?.content else {
                return .failure(PlainError("No data found for key: [\(key)]"))
            }
            return .success(data)
        }
                
        public func save(data: Data, forKey key: String) -> AFResult<Void> {
            storage.setObject(.init(content: data), forKey: key.nsString)
            return .success(())
        }
                
        public func delete(key: String) -> AFResult<Void> {
            storage.removeObject(forKey: key.nsString)
            return .success(())
        }
        
        public func clear() -> AFResult<Void> {
            storage.removeAllObjects()
            return .success(())
        }
    }
    
}
