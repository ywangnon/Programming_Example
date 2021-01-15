//
//  UpToDownViewController.swift
//  UILabelSample
//
//  Created by Hansub Yoo on 2021/01/16.
//

import UIKit

class UpToDownViewController: UIViewController {
    
    @IBOutlet weak var sTextView: UITextView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    
    @IBAction func inputAction(_ sender: UIButton) {
        self.sTextView.text = inputTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sTextView.contentInset = UIEdgeInsets(top: -7, left: 0, bottom: 0, right: 0)
        
    }
}

