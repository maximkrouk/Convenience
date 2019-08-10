//
//  AFResult+TestResultGroup.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Convenience

extension AFResult {
    
    var test: TestResultGroup { .init(results: [void]) }

}
