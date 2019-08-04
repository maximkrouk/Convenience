//
//  Data+Decode.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

extension Data {
    
    func decode<T: Decodable>(to type: T.Type) -> AFResult<T> {
        do {
            let data = try JSONDecoder().decode(T.self, from: self)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
    
}
