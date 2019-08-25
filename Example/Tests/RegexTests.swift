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
    
    func testLetters() {
        TestGroup.assert(success: true) {
            Regex.letters().match("string").test
            Regex.letters(true).match("string").test
            Regex.letters(true, allowSpaces: true).match("string").test
            Regex.letters(true, allowSpaces: true).match(" string ").test
            Regex.letters(true, allowSpaces: false).match("string").test
            Regex.letters(false).match(".").test
            Regex.letters(false, allowSpaces: true).match(" . ").test
            Regex.letters(false, allowSpaces: false).match(".").test
        }
        
        TestGroup.assert(success: false) {
            Regex.letters().match(".").test
            Regex.letters().match(" . ").test
            Regex.letters().match(" string ").test
            Regex.letters().match("string_1").test
            Regex.letters().match(" string_1 ").test
            Regex.letters(true).match(".").test
            Regex.letters(true).match(" . ").test
            Regex.letters(true).match(" string ").test
            Regex.letters(true).match("string_1").test
            Regex.letters(true).match(" string_1 ").test
            Regex.letters(true, allowSpaces: true).match(".").test
            Regex.letters(true, allowSpaces: true).match(" . ").test
            Regex.letters(true, allowSpaces: true).match("string_1").test
            Regex.letters(true, allowSpaces: true).match(" string_1 ").test
            Regex.letters(true, allowSpaces: false).match(".").test
            Regex.letters(true, allowSpaces: false).match(" . ").test
            Regex.letters(true, allowSpaces: false).match(" string ").test
            Regex.letters(true, allowSpaces: false).match("string_1").test
            Regex.letters(true, allowSpaces: false).match(" string_1 ").test
            Regex.letters(false).match(" . ").test
            Regex.letters(false).match("string").test
            Regex.letters(false).match(" string ").test
            Regex.letters(false).match("string_1").test
            Regex.letters(false).match(" string_1 ").test
            Regex.letters(false, allowSpaces: true).match("string").test
            Regex.letters(false, allowSpaces: true).match(" string ").test
            Regex.letters(false, allowSpaces: true).match("string_1").test
            Regex.letters(false, allowSpaces: true).match(" string_1 ").test
            Regex.letters(false, allowSpaces: false).match("string").test
            Regex.letters(false, allowSpaces: false).match(" string ").test
            Regex.letters(false, allowSpaces: false).match("string_1").test
            Regex.letters(false, allowSpaces: false).match(" string_1 ").test
            Regex.letters(false, allowSpaces: false).match(" . ").test
        }
    }
    
    func testDigits() {
        TestGroup.assert(success: true) {
            Regex.digits().match("0123456789").test
            Regex.digits(true).match("0123456789").test
            Regex.digits(true, allowSpaces: true).match("0123456789").test
            Regex.digits(true, allowSpaces: true).match(" 0123456789 ").test
            Regex.digits(true, allowSpaces: false).match("0123456789").test
            Regex.digits(false).match(".").test
            Regex.digits(false, allowSpaces: true).match(" . ").test
            Regex.digits(false, allowSpaces: false).match(".").test
        }
        
        TestGroup.assert(success: false) {
            Regex.digits().match(".").test
            Regex.digits().match(" . ").test
            Regex.digits().match(" 0123456789 ").test
            Regex.digits().match("string_0123456789").test
            Regex.digits().match(" string_0123456789 ").test
            Regex.digits(true).match(".").test
            Regex.digits(true).match(" . ").test
            Regex.digits(true).match(" 0123456789 ").test
            Regex.digits(true).match("string_0123456789").test
            Regex.digits(true).match(" string_0123456789 ").test
            Regex.digits(true, allowSpaces: true).match(".").test
            Regex.digits(true, allowSpaces: true).match(" . ").test
            Regex.digits(true, allowSpaces: true).match("string_0123456789").test
            Regex.digits(true, allowSpaces: true).match(" string_0123456789 ").test
            Regex.digits(true, allowSpaces: false).match(".").test
            Regex.digits(true, allowSpaces: false).match(" . ").test
            Regex.digits(true, allowSpaces: false).match(" 0123456789 ").test
            Regex.digits(true, allowSpaces: false).match("string_0123456789").test
            Regex.digits(true, allowSpaces: false).match(" string_0123456789 ").test
            Regex.digits(false).match(" . ").test
            Regex.digits(false).match("0123456789").test
            Regex.digits(false).match(" 0123456789 ").test
            Regex.digits(false).match("string_0123456789").test
            Regex.digits(false).match(" string_0123456789 ").test
            Regex.digits(false, allowSpaces: true).match("0123456789").test
            Regex.digits(false, allowSpaces: true).match(" 0123456789 ").test
            Regex.digits(false, allowSpaces: true).match("string_0123456789").test
            Regex.digits(false, allowSpaces: true).match(" string_0123456789 ").test
            Regex.digits(false, allowSpaces: false).match("0123456789").test
            Regex.digits(false, allowSpaces: false).match(" 0123456789 ").test
            Regex.digits(false, allowSpaces: false).match("string_0123456789").test
            Regex.digits(false, allowSpaces: false).match(" string_0123456789 ").test
            Regex.digits(false, allowSpaces: false).match(" . ").test
        }
    }
    
    func testHex() {
        TestGroup.assert(success: true) {
            Regex.hex().match("0123456789abcdefABCDEF").test
            Regex.hex(true).match("0123456789abcdefABCDEF").test
            Regex.hex(true, allowSpaces: true).match("0123456789abcdefABCDEF").test
            Regex.hex(true, allowSpaces: true).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(true, allowSpaces: false).match("0123456789abcdefABCDEF").test
            Regex.hex(false).match(".").test
            Regex.hex(false, allowSpaces: true).match(" . ").test
            Regex.hex(false, allowSpaces: false).match(".").test
        }
        
        TestGroup.assert(success: false) {
            Regex.hex().match(".").test
            Regex.hex().match(" . ").test
            Regex.hex().match(" 0123456789abcdefABCDEF ").test
            Regex.hex().match("string_0123456789abcdefABCDEF").test
            Regex.hex().match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(true).match(".").test
            Regex.hex(true).match(" . ").test
            Regex.hex(true).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(true).match("string_0123456789abcdefABCDEF").test
            Regex.hex(true).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(true, allowSpaces: true).match(".").test
            Regex.hex(true, allowSpaces: true).match(" . ").test
            Regex.hex(true, allowSpaces: true).match("string_0123456789abcdefABCDEF").test
            Regex.hex(true, allowSpaces: true).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(true, allowSpaces: false).match(".").test
            Regex.hex(true, allowSpaces: false).match(" . ").test
            Regex.hex(true, allowSpaces: false).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(true, allowSpaces: false).match("string_0123456789abcdefABCDEF").test
            Regex.hex(true, allowSpaces: false).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(false).match(" . ").test
            Regex.hex(false).match("0123456789abcdefABCDEF").test
            Regex.hex(false).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(false).match("string_0123456789abcdefABCDEF").test
            Regex.hex(false).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(false, allowSpaces: true).match("0123456789abcdefABCDEF").test
            Regex.hex(false, allowSpaces: true).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(false, allowSpaces: true).match("string_0123456789abcdefABCDEF").test
            Regex.hex(false, allowSpaces: true).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(false, allowSpaces: false).match("0123456789abcdefABCDEF").test
            Regex.hex(false, allowSpaces: false).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(false, allowSpaces: false).match("string_0123456789abcdefABCDEF").test
            Regex.hex(false, allowSpaces: false).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(false, allowSpaces: false).match(" . ").test
        }
    }
    
}
