//
//  UpToDownViewController.swift
//  UILabelSample
//
//  Created by Hansub Yoo on 2021/01/16.
//

import UIKit

class UpToDownViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    
    @IBAction func inputAction(_ sender: UIButton) {
        self.textLabel.text = self.inputTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textLabel.sizeToFit()
        
    }
}

/*
 UILabel은 레이블의 중간에 글자가 자동으로 맞춰진다.
 UILabel은 수직 정렬을 할 수 있는 방법이 없는듯...
 따라서 UILabel로 하려면 뷰를 만들고 그 크기 안에서 UILabel이 글자에 맞춰 늘어나는 수밖에 없을 듯 하다. 사이즈는 정해져있고 위에서부터 쌓는 화면을 만들고 싶다면 UITextView로 만드는게 어떤가싶다.
 */
