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
            Regex.words(allowSpaces: true).match("string_1").test
            Regex.words(allowSpaces: true).match(" string_1 ").test
            Regex.words(allowSpaces: false).match("string_1").test
        }
        
        TestGroup.assert(success: false) {
            Regex.words().match(".").test
            Regex.words().match(" . ").test
            Regex.words().match(".string_1").test
            Regex.words().match(" .string_1 ").test
            Regex.words(allowSpaces: true).match(".").test
            Regex.words(allowSpaces: true).match(" . ").test
            Regex.words(allowSpaces: true).match(".string_1").test
            Regex.words(allowSpaces: true).match(" .string_1 ").test
            Regex.words(allowSpaces: false).match(".").test
            Regex.words(allowSpaces: false).match(" . ").test
            Regex.words(allowSpaces: false).match(".string_1").test
            Regex.words(allowSpaces: false).match(" .string_1 ").test
            Regex.words(allowSpaces: false).match(" string_1 ").test
        }
    }
    
    func testLetters() {
        TestGroup.assert(success: true) {
            Regex.letters().match("string").test
            Regex.letters(allowSpaces: true).match("string").test
            Regex.letters(allowSpaces: true).match(" string ").test
            Regex.letters(allowSpaces: false).match("string").test
        }
        
        TestGroup.assert(success: false) {
            Regex.letters().match(".").test
            Regex.letters().match(" . ").test
            Regex.letters().match(" string ").test
            Regex.letters().match("string_1").test
            Regex.letters().match(" string_1 ").test
            Regex.letters(allowSpaces: true).match(".").test
            Regex.letters(allowSpaces: true).match(" . ").test
            Regex.letters(allowSpaces: true).match("string_1").test
            Regex.letters(allowSpaces: true).match(" string_1 ").test
            Regex.letters(allowSpaces: false).match(".").test
            Regex.letters(allowSpaces: false).match(" . ").test
            Regex.letters(allowSpaces: false).match(" string ").test
            Regex.letters(allowSpaces: false).match("string_1").test
            Regex.letters(allowSpaces: false).match(" string_1 ").test
        }
    }
    
    func testDigits() {
        TestGroup.assert(success: true) {
            Regex.digits().match("0123456789").test
            Regex.digits().match("0123456789").test
            Regex.digits(allowSpaces: true).match("0123456789").test
            Regex.digits(allowSpaces: true).match(" 0123456789 ").test
            Regex.digits(allowSpaces: false).match("0123456789").test
        }
        
        TestGroup.assert(success: false) {
            Regex.digits().match(".").test
            Regex.digits().match(" . ").test
            Regex.digits().match(" 0123456789 ").test
            Regex.digits().match("string_0123456789").test
            Regex.digits().match(" string_0123456789 ").test
            Regex.digits().match(".").test
            Regex.digits().match(" . ").test
            Regex.digits().match(" 0123456789 ").test
            Regex.digits().match("string_0123456789").test
            Regex.digits().match(" string_0123456789 ").test
            Regex.digits(allowSpaces: true).match(".").test
            Regex.digits(allowSpaces: true).match(" . ").test
            Regex.digits(allowSpaces: true).match("string_0123456789").test
            Regex.digits(allowSpaces: true).match(" string_0123456789 ").test
            Regex.digits(allowSpaces: false).match(".").test
            Regex.digits(allowSpaces: false).match(" . ").test
            Regex.digits(allowSpaces: false).match(" 0123456789 ").test
            Regex.digits(allowSpaces: false).match("string_0123456789").test
            Regex.digits(allowSpaces: false).match(" string_0123456789 ").test
        }
    }
    
    func testHex() {
        TestGroup.assert(success: true) {
            Regex.hex().match("0123456789abcdefABCDEF").test
            Regex.hex().match("0123456789abcdefABCDEF").test
            Regex.hex(allowSpaces: true).match("0123456789abcdefABCDEF").test
            Regex.hex(allowSpaces: true).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(allowSpaces: false).match("0123456789abcdefABCDEF").test
        }
        
        TestGroup.assert(success: false) {
            Regex.hex().match(".").test
            Regex.hex().match(" . ").test
            Regex.hex().match(" 0123456789abcdefABCDEF ").test
            Regex.hex().match("string_0123456789abcdefABCDEF").test
            Regex.hex().match(" string_0123456789abcdefABCDEF ").test
            Regex.hex().match(".").test
            Regex.hex().match(" . ").test
            Regex.hex().match(" 0123456789abcdefABCDEF ").test
            Regex.hex().match("string_0123456789abcdefABCDEF").test
            Regex.hex().match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(allowSpaces: true).match(".").test
            Regex.hex(allowSpaces: true).match(" . ").test
            Regex.hex(allowSpaces: true).match("string_0123456789abcdefABCDEF").test
            Regex.hex(allowSpaces: true).match(" string_0123456789abcdefABCDEF ").test
            Regex.hex(allowSpaces: false).match(".").test
            Regex.hex(allowSpaces: false).match(" . ").test
            Regex.hex(allowSpaces: false).match(" 0123456789abcdefABCDEF ").test
            Regex.hex(allowSpaces: false).match("string_0123456789abcdefABCDEF").test
            Regex.hex(allowSpaces: false).match(" string_0123456789abcdefABCDEF ").test
        }
    }
    
    func testBinary() {
        TestGroup.assert(success: true) {
            Regex.binary().match("1010").test
            Regex.binary().match("1010").test
            Regex.binary(allowSpaces: true).match("1010").test
            Regex.binary(allowSpaces: true).match(" 1010 ").test
            Regex.binary(allowSpaces: false).match("1010").test
        }
        
        TestGroup.assert(success: false) {
            Regex.binary().match(".").test
            Regex.binary().match(" . ").test
            Regex.binary().match("123").test
            Regex.binary().match(" 123 ").test
            Regex.binary().match(" 1010 ").test
            Regex.binary().match("string_1010").test
            Regex.binary().match(" string_1010 ").test
            Regex.binary().match(".").test
            Regex.binary().match(" . ").test
            Regex.binary().match("123").test
            Regex.binary().match(" 123 ").test
            Regex.binary().match(" 1010 ").test
            Regex.binary().match("string_1010").test
            Regex.binary().match(" string_1010 ").test
            Regex.binary(allowSpaces: true).match(".").test
            Regex.binary(allowSpaces: true).match(" . ").test
            Regex.binary(allowSpaces: true).match("123").test
            Regex.binary(allowSpaces: true).match(" 123 ").test
            Regex.binary(allowSpaces: true).match("string_1010").test
            Regex.binary(allowSpaces: true).match(" string_1010 ").test
            Regex.binary(allowSpaces: false).match(".").test
            Regex.binary(allowSpaces: false).match(" . ").test
            Regex.binary(allowSpaces: false).match("123").test
            Regex.binary(allowSpaces: false).match(" 123 ").test
            Regex.binary(allowSpaces: false).match(" 1010 ").test
            Regex.binary(allowSpaces: false).match("string_1010").test
            Regex.binary(allowSpaces: false).match(" string_1010 ").test
        }
    }
    
}
