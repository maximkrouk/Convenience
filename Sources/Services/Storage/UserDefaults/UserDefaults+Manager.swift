//
//  UserDefaults+Manager.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/27/19.
//

import Foundation

public extension Storage.UserDefaults {
    
    final class Manager: StorageManager {
        fileprivate var storage: UserDefaults { .standard }
    
        public static let `default` = Manager()
        
        public func data<Key: Hashable>(forKey key: Key) -> AFResult<Data> {
            guard let data = storage.data(forKey: key.hashValue.string) else {
                return .failure(PlainError("No data found for key [\(key)]."))
            }
            return .success(data)
        }
                
        public func save<Key: Hashable>(data: Data, forKey key: Key) -> AFResult<Void> {
            storage.set(data, forKey: key.hashValue.string)
            return .success(())
        }
                
        public func delete<Key: Hashable>(key: Key) -> AFResult<Void> {
            storage.set(nil, forKey: key.hashValue.string)
            return .success(())
        }
    }
    
}
