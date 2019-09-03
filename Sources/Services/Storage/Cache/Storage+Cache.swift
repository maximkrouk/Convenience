//
//  Storage+Cache.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage.Cache {
    
    /// Specifies a place where data will be stored.
    enum Kind {
        case memory
        case storage(id: String? = .none)
        //case optimized(for: Any.Type)
        case managed(by: StorageManager)
    }
    
}

public extension Storage {
    
    struct Cache {
        public let kind: Kind
        
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
            case let .storage(id: group):
                manager = Persistent(group)
//            case let .optimized(for: type):
            case let .managed(by: storageManager):
                manager = storageManager
            }
            self.kind   =  kind
            self.data   = .init(storageManager: manager)
            self.bool   = .init(storageManager: manager)
            self.string = .init(storageManager: manager)
        }
    }
    
}
