//
//  Result+Extension.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

extension Result {
    
    var isFailure: Bool { !isSuccess }
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
    
    var error: Error? {
        switch self {
        case let .failure(error):
            return error
        default:
            return nil
        }
    }
    
    var value: Success? {
            switch self {
            case let .success(value):
                return value
            default:
                return nil
            }
        }
    
}
