//
//  Storage+Cache.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage {
    
    final class Cache {
        public let kind: Kind
        
        public static let temporary = Cache(.memory)
        public static let persistent = Cache(.storage)
        
        /// Use this instance to store and access Data keychain items.
        private(set) public var data: Provider<Data>!
        
        /// Use this instance to store and access Bool keychain items.
        private(set) public var bool: Provider<Bool>!
        
        /// Use this instance to store and access String keychain items.
        private (set) public var string: Provider<String>!
        
        public init(_ kind: Kind) {
            let manager: StorageManager
            switch kind {
            case .memory:
                manager = Temporary()
            case .storage:
                manager = Persistent()
            case let .custom(storageManager):
                manager = storageManager
            }
            self.kind   =  kind
            self.data   = .init(storageManager: manager)
            self.bool   = .init(storageManager: manager)
            self.string = .init(storageManager: manager)
        }
    }
    
}

public extension Storage.Cache {
    
    /// Specifies a place where data will be stored.
    enum Kind {
        case memory
        case storage
        case custom(StorageManager)
    }
    
}

extension Storage.Cache {
    
    /// A wrapper for data.
    class Item {
        var content: Data
        init(content: Data) { self.content = content }
    }
    
}
