//
//  ViewController.swift
//  UITabbarSample
//
//  Created by Hansub Yoo on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View1")
        
        tabBarController?.viewControllers?.forEach({ vc in
            vc.view
        })
    }


}

