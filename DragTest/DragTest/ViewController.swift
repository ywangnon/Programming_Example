//
//  ViewController.swift
//  DragTest
//
//  Created by Hansub Yoo on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
    var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var draggedView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var xConstraint: NSLayoutConstraint!
    var yConstraint: NSLayoutConstraint!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.countLabel)
        self.view.addSubview(self.draggedView)
        
        NSLayoutConstraint.activate([
            self.countLabel.widthAnchor.constraint(equalToConstant: 100),
            self.countLabel.heightAnchor.constraint(equalToConstant: 60),
            self.countLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.xConstraint = self.draggedView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.yConstraint = self.draggedView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([
            self.draggedView.widthAnchor.constraint(equalToConstant: 100),
            self.draggedView.heightAnchor.constraint(equalToConstant: 100),
            self.xConstraint,
            self.yConstraint
        ])
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(draggingGesture(_:)))
        self.draggedView.addGestureRecognizer(gesture)
        
        self.draggedView.addTarget(self, action: #selector(draggedViewAction(_:)), for: .touchUpInside)
    }
    
    @objc func draggingGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        self.xConstraint.constant = self.xConstraint.constant + translation.x
        self.yConstraint.constant = self.yConstraint.constant + translation.y
        sender.setTranslation(.zero, in: self.draggedView)
        
//        let point = sender.location(in: self.view)
//        let draggedView = sender.view
//        draggedView?.center = point
    }
    
    @objc func draggedViewAction(_ sender: UIButton) {
        self.count += 1
        self.countLabel.text = ("\(count)")
//        print(self.count)
    }
}
