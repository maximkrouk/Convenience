//
//  Storage+Manager.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/3/19.
//

import Foundation


public extension Storage {
    
    class Provider<T>: StorageProvider {
        public typealias Value = T
        
        // Potential memmory leak. (Not critical)
        // TODO: Analyze and fix.
        private(set) public var storage: StorageManager
        
        public init(storageManager: StorageManager) {
            self.storage = storageManager
        }

        // MARK: - Deprecated getters and setters
        @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
        public func get(forKey key: String) -> Value? {
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            debugPrint("Error: call of not implemented StorageProvider.get() method.")
            debugPrint("You should implement `public func get(forKey key: String) -> T?`")
            debugPrint("for `Storage.Provider where T == \(Value.self)`")
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            return nil
        }

        @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
        @discardableResult
        public func set(_ value: Value?, forKey key: String) -> AFResult<Void> {
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            debugPrint("Error: call of not implemented StorageProvider.set() method.")
            debugPrint("You should implement `public func set(_ value: T?, forKey key: String) -> AFResult<Void>`")
            debugPrint("for `Storage.Provider where T == \(Value.self)`")
            debugPrint("–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
            return .failure(PlainError(description: "The operation is not avalible."))
        }
        
        @available(*, deprecated, message: "Use delete(for:) method instead.")
        @discardableResult
        public func delete(forKey key: String) -> AFResult<Void> { storage.delete(key: key) }
    }
    
}

public extension Storage.Provider where T == Data {

    // MARK: - Deprecated getters and setters
    
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> Value? { storage.data(forKey: key).value }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: Value?, forKey key: String) -> AFResult<Void> {
        guard let data = value else {  return delete(forKey: key) }
        return storage.save(data: data, forKey: key)
    }
    
}

public extension Storage.Provider where T == String {

    // MARK: - Deprecated getters and setters
    
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> Value? { storage.data(forKey: key).value?.string(using: .utf8) }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: Value?, forKey key: String) -> AFResult<Void> {
        guard let data = value?.data(using: .utf8) else {  return delete(forKey: key) }
        return storage.save(data: data, forKey: key)
    }
}

public extension Storage.Provider where T == Bool {

    // MARK: - Deprecated getters and setters
    
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> Value? {
        guard let value = storage.data(forKey: key).value?.first else { return nil }
        return value != 0
    }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: Value?, forKey key: String) -> AFResult<Void> {
        guard let data = value?.data else {  return delete(forKey: key) }
        return storage.save(data: data, forKey: key)
    }
    
}

public extension Storage.Provider where T: Codable {

    // MARK: - Deprecated getters and setters

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get(forKey key: String) -> Value? {
        storage.data(forKey: key).value?.decode(to: Value.self).value
    }

    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set(_ value: T?, forKey key: String) -> AFResult<Void> {
        do {
            let data = try JSONEncoder().encode(value)
            return storage.save(data: data, forKey: key)
        } catch {
            return .failure(error)
        }
    }

}
