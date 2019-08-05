//
//  ViewController.swift
//  Convenience
//
//  Created by Maxim Krouk on 08/02/2019.
//  Copyright (c) 2019 Maxim Krouk. All rights reserved.
//

import UIKit
import Convenience

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Storage.UserDefaults.default.bool
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

