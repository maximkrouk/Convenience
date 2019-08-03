//
//  Data+Extension.swift
//  Combine-Try
//
//  Created by Maxim Krouk on 8/1/19.
//  Copyright © 2019 Maxim Krouk. All rights reserved.
//

import Foundation

extension Data {
    func string(_ encoding: String.Encoding) -> String? { String(data: self, encoding: encoding) }
}
