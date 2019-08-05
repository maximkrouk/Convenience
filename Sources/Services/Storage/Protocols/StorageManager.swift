//
//  StorageManager.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/3/19.
//

import Foundation

public protocol StorageManager: class {
    
    /// Loads data from storage for the specified key.
    ///
    /// Note: Completion parameter can be escaping, so be careful with your capture lists.
    ///
    /// - Parameter key: Stored value will be accessable by this key.
    /// - Returns: .success with data if the data was found, .failure with error otherwise.
    func data(forKey key: String) -> AFResult<Data>
    
    /// Saves passed data to storage for the specified key.
    ///
    /// Note: Completion parameter can be escaping, so be careful with your capture lists.
    ///
    /// - Parameter data: Data object to be saved.
    /// - Parameter key: Stored value will be accessable by this key.
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @discardableResult
    func save(data: Data, forKey key: String) -> AFResult<Void>
    
    /// Deletes stored data for the specified key.
    ///
    /// Note: Completion parameter can be escaping, so be careful with your capture lists.
    ///
    /// - Parameter key: Used to find data to delete.
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @discardableResult
    func delete(key: String) -> AFResult<Void>
    
    /// Deletes all the application data from the storage.
    ///
    /// Warning: may be not implemented.
    ///
    /// Note: Completion parameter can be escaping, so be careful with your capture lists.
    ///
    /// - Returns: .success if the operation was successfull, .failure otherwise.
    @discardableResult
    func clear() -> AFResult<Void>
    
}

extension StorageManager {
    
    public func clear() -> AFResult<Void> {
        debugPrint("Error: call of not implemented StorageManager.clear() method.")
        return .failure(PlainError(description: "The operation is not avalible."))
    }
    
}
