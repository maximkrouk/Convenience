//
//  Cache+Persistent.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage.Cache {
    
    final class Persistent: StorageManager {
        private let lock = NSLock()
        private let fileManager = FileManager.default
        public var directory: URL {
            cacheDirectory.appendingPathComponent("\(Bundle.main.bundleIdentifier.unwrap(default: "ConvenienceTempDir"))")
        }
        
        public init() {
            if !fileManager.fileExists(atPath: directory.path) {
                try! fileManager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
            }
        }
        
        public func data<Key: Hashable>(forKey key: Key) -> AFResult<Data> {
            lock.execute {
                guard let data = fileManager.contents(atPath: url(for: key.hashValue.string).path) else {
                    return .failure(PlainError("No data found for key: [\(key)]"))
                }
                return .success(data)
            }
        }

        @discardableResult
        public func save<Key: Hashable>(data: Data, forKey key: Key) -> AFResult<Void> {
            lock.execute {
                let key = key.hashValue.string
                unsafeDelete(key: key)
                let path = url(for: key).path
                let result = fileManager.createFile(atPath: path, contents: data, attributes: nil)
                return result ?
                    .success(()) :
                    .failure(PlainError("File already exists for key: [\(key)]. Failed to rewrite."))
            }
        }
        
        @discardableResult
        public func delete<Key: Hashable>(key: Key) -> AFResult<Void> {
            lock.execute { unsafeDelete(key: key.hashValue.string) }
        }

        @discardableResult
        public func clear() -> AFResult<Void> {
            lock.execute {
                do {
                    let contents = try fileManager.contentsOfDirectory(atPath: directory.path)
                    contents.forEach { try? fileManager.removeItem(atPath: $0) }
                    return .success(())
                } catch {
                    return .failure(error)
                }
            }
        }
        
        @discardableResult
        private func unsafeDelete(key: String) -> AFResult<Void> {
            do {
                let path = url(for: key).path
                if fileManager.fileExists(atPath: path) { try fileManager.removeItem(atPath: path) }
                return .success(())
            } catch {
                return .failure(error)
            }
        }
    }
    
}

private extension Storage.Cache.Persistent {
    
    var cacheDirectory: URL {
        try! fileManager.url(for: .cachesDirectory,
                             in: .userDomainMask,
                             appropriateFor: nil,
                             create: false)
    }
    
    func url(for key: String) -> URL { directory.appendingPathComponent("\(key).tmp", isDirectory: false) }
    
}
