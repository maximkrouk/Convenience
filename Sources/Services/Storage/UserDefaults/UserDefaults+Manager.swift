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
        
        public func data(forKey key: String) -> AFResult<Data> {
            guard let data = storage.data(forKey: key) else {
                return .failure(PlainError("No data found for key [\(key)]."))
            }
            return .success(data)
        }
                
        public func save(data: Data, forKey key: String) -> AFResult<Void> {
            storage.set(data, forKey: key)
            return .success(())
        }
                
        public func delete(key: String) -> AFResult<Void> {
            storage.set(nil, forKey: key)
            return .success(())
        }
    }
    
}
