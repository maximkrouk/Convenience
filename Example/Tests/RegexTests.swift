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
    
    func testWords() {
        TestGroup.assert(success: true) {
            Regex.words().match("string_1").test
            Regex.words().match(" string_1 ").test
            Regex.words(true).match("string_1").test
            Regex.words(true).match(" string_1 ").test
            Regex.words(false).match(".").test
            Regex.words(false).match(" . ").test
            Regex.words(false).match(".").test
            Regex.words(false).match(" . ").test
            Regex.words(allowSpaces: true).match("string_1").test
            Regex.words(allowSpaces: true).match(" string_1 ").test
            Regex.words(allowSpaces: false).match("string_1").test
            Regex.words(true, allowSpaces: true).match("string_1").test
            Regex.words(true, allowSpaces: true).match(" string_1 ").test
            Regex.words(true, allowSpaces: false).match("string_1").test
            Regex.words(false, allowSpaces: true).match(".").test
            Regex.words(false, allowSpaces: true).match(" . ").test
            Regex.words(false, allowSpaces: true).match(".").test
            Regex.words(false, allowSpaces: true).match(" . ").test
            Regex.words(false, allowSpaces: false).match(".").test
            Regex.words(false, allowSpaces: false).match(".").test
        }
        
        TestGroup.assert(success: false) {
            Regex.words().match(".").test
            Regex.words().match(" . ").test
            Regex.words().match(".string_1").test
            Regex.words().match(" .string_1 ").test
            Regex.words(true).match(".").test
            Regex.words(true).match(" . ").test
            Regex.words(true).match(".string_1").test
            Regex.words(true).match(" .string_1 ").test
            Regex.words(false).match("string_1").test
            Regex.words(false).match(" string_1 ").test
            Regex.words(false).match(".string_1").test
            Regex.words(false).match(" .string_1 ").test
            Regex.words(allowSpaces: true).match(".").test
            Regex.words(allowSpaces: true).match(" . ").test
            Regex.words(allowSpaces: true).match(".string_1").test
            Regex.words(allowSpaces: true).match(" .string_1 ").test
            Regex.words(allowSpaces: false).match(".").test
            Regex.words(allowSpaces: false).match(" . ").test
            Regex.words(allowSpaces: false).match(".string_1").test
            Regex.words(allowSpaces: false).match(" .string_1 ").test
            Regex.words(allowSpaces: false).match(" string_1 ").test
            Regex.words(true, allowSpaces: true).match(".").test
            Regex.words(true, allowSpaces: true).match(" . ").test
            Regex.words(true, allowSpaces: true).match(".string_1").test
            Regex.words(true, allowSpaces: true).match(" .string_1 ").test
            Regex.words(true, allowSpaces: false).match(".").test
            Regex.words(true, allowSpaces: false).match(" . ").test
            Regex.words(true, allowSpaces: false).match(".string_1").test
            Regex.words(true, allowSpaces: false).match(" .string_1 ").test
            Regex.words(true, allowSpaces: false).match(" string_1 ").test
            Regex.words(false, allowSpaces: true).match("string_1").test
            Regex.words(false, allowSpaces: true).match(" string_1 ").test
            Regex.words(false, allowSpaces: true).match(".string_1").test
            Regex.words(false, allowSpaces: true).match(" .string_1 ").test
            Regex.words(false, allowSpaces: false).match(" . ").test
            Regex.words(false, allowSpaces: false).match(".string_1").test
            Regex.words(false, allowSpaces: false).match(" .string_1 ").test
        }
    }
    
}
