//
//  InheritViewController.swift
//  BasicViewSample
//
//  Created by Hansub Yoo on 2021/07/27.
//

import UIKit

class InheritViewController: BasicViewController {
    
    var warningButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        print("시도")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setAddSubViews()
        self.setLayouts()
        self.setAddTargets()
        
    }
    
    func setAddSubViews() {
        self.view.addSubview(warningButton)
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.warningButton.widthAnchor.constraint(equalToConstant: 100),
            self.warningButton.heightAnchor.constraint(equalToConstant: 100),
            self.warningButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.warningButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func setAddTargets() {
        self.warningButton.addTarget(self, action: #selector(self.showWarningStatement), for: .allTouchEvents)
    }
    
}
