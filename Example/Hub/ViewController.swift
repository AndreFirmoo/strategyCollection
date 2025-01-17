//
//  ViewController.swift
//  Hub
//
//  Created by Andre Firmo on 08/18/2024.
//  Copyright (c) 2024 Andre Firmo. All rights reserved.
//

import UIKit
import Hub

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let hub = MenuCoordinator(navigationController: self.navigationController ?? UINavigationController())
        hub.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

