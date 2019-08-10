//
//  RegexTests.swift
//  Convenience_Example
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Convenience
import SwiftUI

class RegexTests: XCTestCase {
        
    func testEmpty() {
        TestGroup.assert(success: true) {
            Regex.empty().match("").test
            Regex.empty(true).match("").test
            Regex.empty(false).match("string").test
        }
        
        TestGroup.assert(success: false) {
            Regex.empty().match("string").test
            Regex.empty(true).match("string").test
            Regex.empty(false).match("").test
        }
    }
    
}
