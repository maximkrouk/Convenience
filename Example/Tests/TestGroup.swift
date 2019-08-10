//
//  TestGroup.swift
//  Convenience_Example
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Convenience

struct TestGroup {
    let results: [AFResult<Void>]
    init(@TestGroup.Builder closure: TestGroup.Builder.Block) { results = closure().results }
    
    var isFailure: Bool { !isSuccess }
    var isSuccess: Bool { results.reduce(true, { $0 && $1.isSuccess }) }
    var errors: Errors { results.compactMap { $0.error } }
    
    func forEach(_ execute: (AFResult<Void>) throws -> Void) rethrows { try results.forEach(execute) }
    
    static func assert(success: Bool,
                       _ message: @autoclosure () -> String? = "",
                       file: StaticString = #file,
                       line: UInt = #line,
                       @TestGroup.Builder closure: TestGroup.Builder.Block) {
        var line = line
        TestGroup(closure: closure).forEach {
            line += 1
            guard $0.isSuccess == success else {
                let error = $0.error?.localizedDescription
                let message = message() ?? error.unwrap()
                XCTFail(message, file: file, line: line)
                return
            }
        }
    }
}
