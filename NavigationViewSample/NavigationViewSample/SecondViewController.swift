//
//  SecondViewController.swift
//  NavigationViewSample
//
//  Created by Hansub Yoo on 2021/10/29.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("SecondVC did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("SecondVC will appeaer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("SecondVC did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("SecondVC will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("SecondVC did disappear")
    }
}
