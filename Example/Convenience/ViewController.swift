//
//  ViewController.swift
//  Convenience
//
//  Created by Maxim Krouk on 08/02/2019.
//  Copyright (c) 2019 Maxim Krouk. All rights reserved.
//

import UIKit
import Convenience

enum Auth: String {
    case username
    case isAdmin
}

extension Storage.Provider {
    subscript(key: Auth) -> Value? {
        get { get(for: key) }
        set { set(newValue, for: key) }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Storage.Keychain.default.bool[.isAdmin] = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

