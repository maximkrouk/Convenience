//
//  StorageProvider.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

public protocol StorageProvider: class {
    associatedtype Value
    
    // MARK: - Subscripts
    
    /// Allows you to interact with selected storage provider just as simple as to a collection.
    ///
    /// - Parameter key: Stored value will be accessable by this key.
    subscript<Key: RawRepresentable>(_ key: Key) -> Value? where Key.RawValue: Hashable { get set }
    
    /// Allows you to interact with selected storage provider just as simple as to a collection.
    ///
    /// It's a bad practice to use plain strings in your application, variables or constants are better,
    /// but string based enums are mush cleaner, try them, or ignore the warning if you have to use strings.
    ///
    /// If you want to silence the warning globaly, you may do this:
    /// (NOT RECOMMENDED)
    /// ```
    /// extension String: RawRepresentable {
    ///     public init(rawValue: String) { self = rawValue }
    ///     public var rawValue: String { self }
    /// }
    /// ```
    @available(*, deprecated, message: "Use your semantic string based enums as a parameter to this subscript.")
    subscript(_ key: String) -> Value? { get set }
    
    
    // MARK: - Respectable getters and setters
    
    /// Data getter.
    ///
    /// Loads value from selected storage provider.
    ///
    /// - Returns: Stored data obect if pesent, nil if not.
    func get<Key: RawRepresentable>(for key: Key) -> Value? where Key.RawValue: Hashable
    
    /// Data setter.
    ///
    /// Saves value to the selected storage provider.
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @discardableResult
    func set<Key: RawRepresentable>(_ value: Value?, for key: Key) -> AFResult<Void> where Key.RawValue: Hashable
    
    /// Data eraser.
    ///
    /// Deletes value from the selected storage provider.
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @discardableResult
    func delete<Key: RawRepresentable>(for key: Key) -> AFResult<Void> where Key.RawValue: Hashable
    
    // MARK: - Deprecated getters and setters
    
    /// Data getter.
    ///
    /// Loads value from selected storage provider.
    ///
    /// It's a bad practice to use plain strings in your application, variables or constants are better,
    /// but string based enums are mush cleaner, try them, or ignore the warning if you have to use strings.
    ///
    /// If you want to silence the warning globaly, you may do this:
    /// (NOT RECOMMENDED)
    /// ```
    /// extension String: RawRepresentable {
    ///     public init(rawValue: String) { self = rawValue }
    ///     public var rawValue: String { self }
    /// }
    /// ```
    ///
    /// - Returns: Stored data obect if pesent, nil if not.
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    func get<Key: Hashable>(forKey key: Key) -> Value?

    
    /// Data setter.
    ///
    /// Saves value to the selected storage provider.
    ///
    /// It's a bad practice to use plain strings in your application, variables or constants are better,
    /// but string based enums are mush cleaner, try them, or ignore the warning if you have to use strings.
    ///
    /// If you want to silence the warning globaly, you may do this:
    /// (NOT RECOMMENDED)
    /// ```
    /// extension String: RawRepresentable {
    ///     public init(rawValue: String) { self = rawValue }
    ///     public var rawValue: String { self }
    /// }
    /// ```
    ///
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @available(*, deprecated, message: "Use get(for:) method or subscript instead.")
    @discardableResult
    func set<Key: Hashable>(_ value: Value?, forKey key: Key) -> AFResult<Void>
    
    /// Data eraser.
    ///
    /// Deletes value from the selected storage provider.
    ///
    /// It's a bad practice to use plain strings in your application, variables or constants are better,
    /// but string based enums are mush cleaner, try them, or ignore the warning if you have to use strings.
    ///
    /// If you want to silence the warning globaly, you may do this:
    /// (NOT RECOMMENDED)
    /// ```
    /// extension String: RawRepresentable {
    ///     public init(rawValue: String) { self = rawValue }
    ///     public var rawValue: String { self }
    /// }
    /// ```
    ///
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @available(*, deprecated, message: "Use delete(for:) method instead.")
    @discardableResult
    func delete<Key: Hashable>(forKey key: Key) -> AFResult<Void>
    
}

extension StorageProvider {
    
    public subscript<Key: RawRepresentable>(_ key: Key) -> Value? where Key.RawValue: Hashable {
        get { self[key~] }
        set { self[key~] = newValue }
    }
    
    @available(*, deprecated, message: "Use your semantic string based enums as a parameter to this subscript.")
    public subscript<Key: Hashable>(_ key: Key) -> Value? {
        get { get(forKey: key) }
        set { set(newValue, forKey: key) }
    }
    
    public func get<Key: RawRepresentable>(for key: Key) -> Value? where Key.RawValue: Hashable {
        get(forKey: key~)
    }

    @discardableResult
    public func set<Key: RawRepresentable>(_ value: Value?, for key: Key) -> AFResult<Void> where Key.RawValue: Hashable {
        set(value, forKey: key~)
    }

    @discardableResult
    public func delete<Key: RawRepresentable>(for key: Key) -> AFResult<Void> where Key.RawValue: Hashable {
        delete(forKey: key~)
    }
    
}

