//
//  Data+Decode.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

extension Data {
    
    /// Decodes json encoded data from self.
    ///
    /// - Returns: .success(typeObject) if decoding succeed, .failure(error) otherwise.
    func decode<T: Decodable>(to type: T.Type) -> AFResult<T> {
        do {
            let object = try JSONDecoder().decode(T.self, from: self)
            return .success(object)
        } catch {
            return .failure(error)
        }
    }
    
}
