//
//  ViewController.swift
//  ARC_Example
//
//  Created by Hansub Yoo on 2020/09/19.
//

import UIKit

class ViewController: UIViewController {

    // 스토리보드의 오토레이아웃값
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    // 코드의 오토레이아웃값
    var codeView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var topConstraintCode: NSLayoutConstraint!
    var bottomConstraintCode: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 코드 화면 생성
        self.setCodeViewAutolayout()
        
        // 코드와 스토리보드로 만든 UI 비활성화
        print("\n---------- [ 비활성화 ] ----------\n")
        self.changeWeakConstraintFromStoryboard()
//        self.changeStrongConstraintFromStoryboard()
        self.changeWeakConstraintFromCode()
        self.changeStrongConstraintFromCode()
        
        /**
         오토레이아웃 활성화
         값이 nil이라면 오류
         */
        print("\n---------- [ 활성화 ] ----------\n")
        self.changeWeakConstraintFromStoryboard()
//        self.changeStrongConstraintFromStoryboard()
        self.changeWeakConstraintFromCode()
        self.changeStrongConstraintFromCode()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 코드로 UI 생성
    func setCodeViewAutolayout() {
        self.view.addSubview(self.codeView)
        
        self.topConstraintCode = self.codeView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        self.bottomConstraintCode = self.codeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100)
        
        NSLayoutConstraint.activate([
            self.topConstraintCode,
            self.bottomConstraintCode,
            self.codeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            self.codeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100)
        ])
    }
    
    // 오토레이아웃 활성화 변화
    
    /// 스토리보드에서 만든 Weak으로 설정된 탑 컨스트레인트의 활성화 여부
    func changeWeakConstraintFromStoryboard() {
        self.topConstraint.isActive = !self.topConstraint.isActive
    }
    
    /// 스토리보드에서 만든 Strong으로 설정된 바텀 컨스트레인트의 활성화 여부
    func changeStrongConstraintFromStoryboard() {
        self.bottomConstraint.isActive = !self.bottomConstraint.isActive
    }
    
    /// 코드로 만든 Weak으로 설정된 탑 컨스트레인트의 활성화 여부
    func changeWeakConstraintFromCode() {
        self.topConstraintCode.isActive = !self.topConstraintCode.isActive
    }
    
    /// 코드로 만든 Strong으로 설정된 바텀 컨스트레인트의 활성화 여부
    func changeStrongConstraintFromCode() {
        self.bottomConstraintCode.isActive = !self.bottomConstraintCode.isActive
    }
    
}

