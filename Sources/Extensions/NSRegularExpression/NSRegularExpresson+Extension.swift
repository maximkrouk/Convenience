//
//  NSRegularExpresson+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

/// An immutable representation of a compiled regular expression that you apply to Unicode strings.
///
/// The fundamental matching method for NSRegularExpression is a Block iterator method that allows clients to supply a Block object which will be invoked each time the regular expression matches a portion of the target string. There are additional convenience methods for returning all the matches as an array, the total number of matches, the first match, and the range of the first match.
///
/// An individual match is represented by an instance of the [NSTextCheckingResult](https://developer.apple.com/documentation/foundation/nstextcheckingresult) class, which carries information about the overall matched [range](https://developer.apple.com/documentation/foundation/nstextcheckingresult/1415852-range) (via its range property), and the range of each individual capture group (via the [range(at:)](https://developer.apple.com/documentation/foundation/nstextcheckingresult/1416732-range) method). For basic NSRegularExpression objects, these match results will be of type [regularExpression](https://developer.apple.com/documentation/foundation/nstextcheckingresult/checkingtype/1408922-regularexpression), but subclasses may use other types. The ICU regular expressions supported by NSRegularExpression are described at [http://userguide.icu-project.org/strings/regexp](http://userguide.icu-project.org/strings/regexp).
public typealias Regex = NSRegularExpression

public extension Regex {
    
    /// Creates a new instance with specified pattern and options.
    convenience init(_ pattern: String, options: Options = []) {
        do {
            try self.init(pattern: pattern, options: options)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }

    /// - Returns: true if the parameter matches self, false otherwise.
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
    
}

public extension Regex {
    
    /// Returns regex for hex color representation. (With or without one leading "#")
    static var color: Regex { "#{0,1}[0-9A-F]{6}".regex(.caseInsensitive) }
    
}
