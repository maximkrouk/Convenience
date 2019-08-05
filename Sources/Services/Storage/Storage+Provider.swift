//
//  Storage+Manager.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/3/19.
//

import Foundation


public extension Storage {
    class Provider<T>: StorageProvider {
        private weak var storage: StorageManager!
        public init(storageProvider: StorageManager) {
            self.storage = storageProvider
        }
        
        public subscript<Key: RawRepresentable>(_ key: Key) -> T? where Key.RawValue == String {
            get { self[key~] }
            set { self[key~] = newValue }
        }
        
        @available(*, deprecated, message: "Use your semantic string based enums as a parameter to this subscript.")
        public subscript(_ key: String) -> T? {
            get { get(forKey: key) }
            set { set(newValue, forKey: key) }
        }
        
        // MARK: - Respectable getters and setters
        
        public func get<Key: RawRepresentable>(for key: Key) -> T? where Key.RawValue == String { get(forKey: key~) }

        @discardableResult
        public func set<Key: RawRepresentable>(_ value: T?, for key: Key) -> AFResult<Void> where Key.RawValue == String { set(value, forKey: key~) }

        @discardableResult
        public func delete<Key: RawRepresentable>(for key: Key) -> AFResult<Void> where Key.RawValue == String { delete(forKey: key~) }

        // MARK: - Deprecated getters and setters
        
        @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
        public func get(forKey key: String) -> T? {
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            debugPrint("Error: call of not implemented StorageProvider.get() method.\n")
            debugPrint("You should implement `public func get(forKey key: String) -> T?`")
            debugPrint("for `Storage.Provider where T == \(T.self)`")
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            return nil
        }

        @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
        @discardableResult
        public func set(_ value: T?, forKey key: String) -> AFResult<Void> {
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            debugPrint("Error: call of not implemented StorageProvider.set() method.")
            debugPrint("You should implement `public func set(_ value: T?, forKey key: String) -> AFResult<Void>`")
            debugPrint("for `Storage.Provider where T == \(T.self)`")
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            return .failure(PlainError(localizedDescription: "The operation is not avalible."))
        }

        @available(*, deprecated, message: "Use delete(for:) method instead.")
        @discardableResult
        public func delete(forKey key: String) -> AFResult<Void> { storage.delete(key: key) }
        
    }
}

public extension Storage.Provider where T == Data {

    // MARK: - Deprecated getters and setters
    
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> T? { storage?.data(forKey: key).value }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: T?, forKey key: String) -> AFResult<Void> {
        if let data = value { return storage.save(data: data, forKey: key) }
        else { return delete(forKey: key) }
    }
    
}

public extension Storage.Provider where T == String {

    // MARK: - Deprecated getters and setters
    
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> T? { storage?.data(forKey: key).value?.string(using: .utf8) }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: T?, forKey key: String) -> AFResult<Void> {
        if let data = value?.data(using: .utf8) { return storage.save(data: data, forKey: key) }
        else { return delete(forKey: key) }
    }
    
}

public extension Storage.Provider where T == Bool {

    // MARK: - Deprecated getters and setters
    
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> T? {
        guard let value = storage?.data(forKey: key).value?.first else { return nil }
        return value != 0
    }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: T?, forKey key: String) -> AFResult<Void> {
        if let value = value {
            return storage.save(data: value.data, forKey: key)
        }
        else { return delete(forKey: key) }
    }
    
}
