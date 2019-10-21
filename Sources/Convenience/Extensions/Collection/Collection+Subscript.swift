//
//  Collection+Subscript.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation

public extension Collection {
    
    /// Returns the amount of elements, when counting from zero or nil if the collection is empty.
    var lastIndex: Int? { isEmpty ? nil : count - 1 }
    
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    
}

public extension BidirectionalCollection {
    
    subscript(safe offset: Int) -> Element? {
        isEmpty && (0..<count).contains(offset) ? self[offset] : nil
    }
    
    subscript(offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(range: Range<Int>) -> SubSequence {
        prefix(range.lowerBound + range.count).suffix(range.count)
    }
    
    subscript(range: ClosedRange<Int>) -> SubSequence {
        prefix(range.lowerBound + range.count).suffix(range.count)
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        prefix(range.upperBound.advanced(by: 1))
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        prefix(range.upperBound)
    }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        suffix(Swift.max(0, count - range.lowerBound))
    }
    
}
