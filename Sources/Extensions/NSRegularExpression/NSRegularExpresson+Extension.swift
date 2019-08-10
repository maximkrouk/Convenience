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
    
    typealias Result = AFResult<String>
    
    /// Creates a new instance with specified pattern and options.
    convenience init(_ pattern: String, options: Options = []) {
        do {
            try self.init(pattern: pattern, options: options)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    var descriptor: Descriptor { Descriptor(regex: self) }

    /// Matches a string with self.
    ///
    /// - Parameter string: string to find regex matches in.
    /// - Returns: .success(string) if the parameter matches self, .failure(error) otherwise.
    func match(_ string: String) -> Result {
        let range = NSRange(0..<string.count)
        return firstMatch(in: string, options: [], range: range).isNil ?
            .failure(descriptor.description) :
            .success(string)
    }
    
}

public extension Regex {
    
    /// Regex getter for an empty or non-empty string regex.
    ///
    /// Expression string: "
    /// - Emply string: "`"^$"`"
    /// - Non-empty string: `"^..*$"`
    ///
    /// - Parameter value: Specifies if returned regex should match an empty or non-empty string.
    /// - Returns: Regex that matches any line of word characters.
    static func empty(_ value: Bool = true) -> Regex { (value ? "^$" : "^..*$").regex() }
        
    /// Regex getter for a word-character or non-word-character string regex.
    ///
    /// Word characters:
    /// - a-z
    /// - A-Z
    /// - 0-9
    /// - _ (underscore).
    ///
    /// Expression string:
    /// - Spaces restricted: `"^\w*$"`
    /// - Spaces allowed: `"^[\s\w]*$"`
    ///
    /// - Parameter allowSpaces: Specifies if returned regex should match a word-character string with spaces.
    /// - Returns: Regex that matches any line of word characters.
    static func words(_ value: Bool = true, allowSpaces: Bool = true) -> Regex {
        let not = value ? "" : "^"
        let spaces = allowSpaces == value ? "\\s" : ""
        return "^[\(not)[\\w\(spaces)]*$".regex()
    }
    
    /// Regex getter for a alphabetic or non-alphabetic string regex.
    ///
    /// Expression string:
    /// - No letters, no spaces: `"^[^[:alpha:]\s]*$"`
    /// - No letters, spaces: `"^[^[:alpha:]]*$"`
    /// - Letters, no spaces: `"^[[:alpha:]]*$"`
    /// - Letters, spaces: `"^[[:alpha:]\s]*$"`
    ///
    /// - Parameter value: Specifies if returned regex should match a letter string.
    /// - Parameter allowSpaces: Specifies if returned regex should match a word-character string with spaces.
    /// - Returns: Regex that matches any line of word characters.
    static func letters(_ value: Bool = true, allowSpaces: Bool = false) -> Regex {
        let not = value ? "" : "^"
        let spaces = allowSpaces == value ? "\\s" : ""
        return "^[\(not)[:alpha:]\(spaces)]*$".regex()
    }

    /// Regex getter for a digital or non-digital string regex.
    ///
    /// Expression string:
    /// - No digits, no spaces: `"^[^[:digit:]\s]*$"`
    /// - No digits, spaces: `"^[^[:digit:]]*$"`
    /// - Digits, no spaces: `"^[[:digit:]]*$"`
    /// - Digits, spaces: `"^[[:digit:]\s]*$"`
    ///
    /// - Parameter value: Specifies if returned regex should match a digital string.
    /// - Parameter allowSpaces: Specifies if returned regex should match a word-character string with spaces.
    /// - Returns: Regex that matches any line of word characters.
    static func digits(_ value: Bool = true, allowSpaces: Bool = false) -> Regex {
        let not = value ? "" : "^"
        let spaces = allowSpaces == value ? "\\s" : ""
        return "^[\(not)[:digit:]\(spaces)]*$".regex()
    }
    
    /// Regex getter for a hex or non-hex string regex.
    ///
    /// Expression string:
    /// - No digits, no spaces: `"^[^[:xdigit:]\s]*$"`
    /// - No digits, spaces: `"^[^[:xdigit:]]*$"`
    /// - Digits, no spaces: `"^[[:xdigit:]]*$"`
    /// - Digits, spaces: `"^[[:xdigit:]\s]*$"`
    ///
    /// - Parameter value: Specifies if returned regex should match a digital string.
    /// - Parameter allowSpaces: Specifies if returned regex should match a word-character string with spaces.
    /// - Returns: Regex that matches any line of word characters.
    static func hex(_ value: Bool = true, allowSpaces: Bool = false) -> Regex {
        let not = value ? "" : "^"
        let spaces = allowSpaces == value ? "\\s" : ""
        return "^[\(not)[:xdigit:]\(spaces)]*$".regex()
    }
    
    /// Regex getter for a binary or non-binary string regex.
    ///
    /// Expression string:
    /// - No digits, no spaces: `"^[^0-1\s]*$"`
    /// - No digits, spaces: `"^[^0-1]*$"`
    /// - Digits, no spaces: `"^[0-1]*$"`
    /// - Digits, spaces: `"^[0-1\s]*$"`
    ///
    /// - Parameter value: Specifies if returned regex should match a digital string.
    /// - Parameter allowSpaces: Specifies if returned regex should match a word-character string with spaces.
    /// - Returns: Regex that matches any line of word characters.
    static func binary(_ value: Bool = true, allowSpaces: Bool = false) -> Regex {
        let not = value ? "" : "^"
        let spaces = allowSpaces == value ? "\\s" : ""
        return "^[\(not)0-1\(spaces)]*$".regex()
    }

    /// Regex getter for a hex-color string regex.
    ///
    /// With or without one leading "#"
    ///
    /// - Expression string: "`^#{0,1}[[:xdigit:]]{6}(?:[[:xdigit:]]{2})?$`"
    ///
    /// - Returns: Regex for hex color representation.
    static func color() -> Regex { "^#{0,1}[[:xdigit:]]{6}(?:[[:xdigit:]]{2})?$".regex() }

    /// Regex getter for email string.
    ///
    /// Taken from [here](https://emailregex.com)
    ///
    /// - Expression string: "`[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}`"
    /// - Flags: `[.caseInsensitive]`
    ///
    /// - Returns: Regex for email.
    static func email() -> Regex { "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[[:alpha:]]]{2,64}".regex() }

    /// Regex getter for ipv4-address string regex.
    ///
    /// Taken from [here](https://www.regextester.com/22)
    ///
    /// - Expression string: "`^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$`"
    ///
    /// - Returns: Regex for ipv4 address.
    static func ipv4() -> Regex {
        "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$".regex()
    }
    
}
