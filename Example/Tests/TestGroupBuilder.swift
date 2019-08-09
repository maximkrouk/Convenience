//
//  TestGroupBuilder.swift
//  Convenience_Example
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Convenience

@_functionBuilder
struct TestGroupBuilder<T> {
    typealias Block = () -> TestResultGroup<T>
    static func buildBlock(_ groups: TestResultGroup<T>...) -> TestResultGroup<T> {
        TestResultGroup<T>(results: groups.reduce([], { $0 + $1.results }))
    }
}
