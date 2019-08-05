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
        
        public static let `default` = Cache(.memory)
        
        /// Returns `Cache.default.data` instance.
        public static var data: Provider<Data> { Cache.default.data }
        
        /// Returns `Cache.default.bool` instance.
        public static var bool: Provider<Bool> { Cache.default.bool }
        
        /// Returns `Cache.default.string` instance.
        public static var string: Provider<String> { Cache.default.string }
        
        /// Use this instance to store and access Data keychain items.
        private(set) public var data: Provider<Data>!
        
        /// Use this instance to store and access Bool keychain items.
        private(set) public var bool: Provider<Bool>!
        
        /// Use this instance to store and access String keychain items.
        private (set) public var string: Provider<String>!
        
        public init(_ kind: Kind) {
            self.kind   =  kind
            let storageProvider: StorageManager = kind == .memory ? Temporary.default : Presistant.default
            self.data   = .init(storageProvider: storageProvider)
            self.bool   = .init(storageProvider: storageProvider)
            self.string = .init(storageProvider: storageProvider)
        }
    }
    
}

public extension Storage.Cache {
    
    enum Kind {
        case memory
        case storage
    }
    
}

extension Storage.Cache {
    
    class Item {
        var content: Data
        init(content: Data) { self.content = content }
    }
    
}
