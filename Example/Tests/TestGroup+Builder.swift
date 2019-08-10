//
//  TestGroup+Builder.swift
//  Convenience_Example
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Convenience

extension TestGroup {
    @_functionBuilder
    struct Builder {
        typealias Block = () -> TestResultGroup
        static func buildBlock(_ groups: TestResultGroup...) -> TestResultGroup {
            .init(results: groups.reduce([AFResult<Void>](), { $0 + $1.results }))
        }
    }
}
