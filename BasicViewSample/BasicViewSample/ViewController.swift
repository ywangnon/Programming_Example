//
//  ViewController.swift
//  BasicViewSample
//
//  Created by Hansub Yoo on 2021/07/26.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.titleLabel?.text = "Next"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
    }
    
    func setAddSubViews() {
        self.view.addSubview(self.nextButton)
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.nextButton.widthAnchor.constraint(equalToConstant: 100),
            self.nextButton.heightAnchor.constraint(equalToConstant: 100),
            self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func setAddTargets() {
        self.nextButton.addTarget(self, action: #selector(self.showNextView), for: .allTouchEvents)
    }
    
}

extension ViewController {
    @objc func showNextView() {
        let nextVC = InheritViewController()
        self.present(nextVC, animated: true, completion: nil)
    }
}

