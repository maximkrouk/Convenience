//
//  Cache+Presistant.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/5/19.
//

import Foundation

public extension Storage.Cache {
    
    class Presistant: StorageManager {
        private let fileManager = FileManager.default
        public var directory: URL {
            cacheDirectory.appendingPathComponent("./\(Bundle.main.bundleIdentifier.unwrap(default: "ConvenienceTempDir"))")
        }
        
        public static let `default` = Presistant()
        
        public init() {
            if !fileManager.fileExists(atPath: directory.path) {
                try! fileManager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
            }
        }
        
        public func data(forKey key: String) -> AFResult<Data> {
            guard let data = fileManager.contents(atPath: url(for: key).path) else {
                return .failure(PlainError("No data found for key: [\(key)]"))
            }
            return .success(data)
        }

        @discardableResult
        public func save(data: Data, forKey key: String) -> AFResult<Void> {
            let path = url(for: key).path
            delete(key: key)
            let result = fileManager.createFile(atPath: path, contents: data, attributes: nil)
            return result ?
                .success(()) :
                .failure(PlainError("File already exists for key: [\(key)]. Failed to rewrite."))
        }
        
        @discardableResult
        public func delete(key: String) -> AFResult<Void> {
            do {
                let path = url(for: key).path
                if fileManager.fileExists(atPath: path) { try fileManager.removeItem(atPath: path) }
                return .success(())
            } catch {
                return .failure(error)
            }
        }

        @discardableResult
        public func clear() -> AFResult<Void> {
            do {
                let contents = try fileManager.contentsOfDirectory(atPath: directory.path)
                contents.forEach { try? fileManager.removeItem(atPath: $0) }
                return .success(())
            } catch {
                return .failure(error)
            }
        }
    }
    
}

extension Storage.Cache.Presistant {
    var cacheDirectory: URL {
        try! fileManager.url(for: .cachesDirectory,
                             in: .userDomainMask,
                             appropriateFor: nil,
                             create: false)
    }
    
    func url(for key: String) -> URL { directory.appendingPathComponent("(key).tmp") }
}
