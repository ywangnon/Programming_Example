//
//  BasicViewController.swift
//  BasicViewSample
//
//  Created by Hansub Yoo on 2021/07/26.
//

import UIKit

class BasicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func showWarningStatement() {
        let alert = UIAlertController(title: "경고문", message: "경고문입니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
