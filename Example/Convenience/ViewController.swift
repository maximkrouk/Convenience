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

    let storage = Storage.Cache(.storage(id: .none)).bool!
    
    enum Key: String {
        case bool = "ViewController.Key.bool"
    }
    
    private(set) public var button: UIButton = {
        modification(of: .init()) {
            $0.addTarget(self, action: #selector(update), for: .touchUpInside)
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        modify(button) {
            view.addSubview($0)
            $0.frame = view.frame
            $0.setTitleColor(.red, for: .normal)
        }
        update()
    }
    
    @objc func update() {
        let item = storage[.bool].unwrap(default: false)
        modify(button) {
            $0.setTitle(item ? "true" : "false", for: .normal)
        }
        storage[.bool] = !item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
