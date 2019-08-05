//
//  Cache+Temporary.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage.Cache {
    
    class Temporary: StorageManager {
        private let standard = NSCache<NSString, Item>()
        public static let `default` = Temporary()
        
        public func data(forKey key: String) -> AFResult<Data> {
            guard let data = standard.object(forKey: key.nsString)?.content else {
                return .failure(PlainError("No data found for key: [\(key)]"))
            }
            return .success(data)
        }
                
        public func save(data: Data, forKey key: String) -> AFResult<Void> {
            standard.setObject(.init(content: data), forKey: key.nsString)
            return .success(())
        }
                
        public func delete(key: String) -> AFResult<Void> {
            standard.removeObject(forKey: key.nsString)
            return .success(())
        }
        
        public func clear() -> AFResult<Void> {
            standard.removeAllObjects()
            return .success(())
        }
    }
    
}
