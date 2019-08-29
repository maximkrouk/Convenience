//
//  ViewController.swift
//  Convenience
//
//  Created by Maxim Krouk on 08/02/2019.
//  Copyright (c) 2019 Maxim Krouk. All rights reserved.
//

import UIKit
import Convenience

fileprivate extension StorageProvider {
    
    subscript(_ key: ViewController.Key) -> Value? {
        get { self[key.rawValue] }
        set { self[key.rawValue] = newValue }
    }
    
}

class ViewController: UIViewController {
    
    enum Key: String {
        case bool = "ViewController.Key.bool"
    }
    
    private(set) public var label: UILabel = {
        modification(of: .init()) { $0.textAlignment = .center }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        modify(label) {
            view.addSubview($0)
            $0.frame = view.frame
            $0.text = true ? "true" : "false"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
