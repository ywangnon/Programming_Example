//
//  ViewController.swift
//  NavigationViewSample
//
//  Created by Hansub Yoo on 2021/10/27.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("FirstVC did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("FirstVC will appeaer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("FirstVC did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("FirstVC will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("FirstVC did disappear")
    }
}

