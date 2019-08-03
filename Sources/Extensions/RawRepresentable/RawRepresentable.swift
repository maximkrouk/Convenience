//
//  RawRepresentable.swift
//  Combine-Try
//
//  Created by Maxim Krouk on 8/1/19.
//  Copyright © 2019 Maxim Krouk. All rights reserved.
//

extension RawRepresentable {
    static postfix func ~(lhs: Self) -> RawValue { lhs.rawValue }
}
