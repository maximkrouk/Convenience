//
//  Data+Extension.swift
//  Combine-Try
//
//  Created by Maxim Krouk on 8/1/19.
//  Copyright © 2019 Maxim Krouk. All rights reserved.
//

import Foundation

extension Data {
    
    /// Returns a string initialized with self and passed encoding.
    func string(using encoding: String.Encoding) -> String? { String(data: self, encoding: encoding) }
    
}
