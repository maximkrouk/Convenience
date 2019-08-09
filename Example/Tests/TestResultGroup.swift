//
//  TestResultGroup.swift
//  Convenience_Example
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

typealias RegexTestGroup = TestGroup<String>

struct TestResultGroup<T> {
    
    let results: [Result<T, Error>]
    
}
