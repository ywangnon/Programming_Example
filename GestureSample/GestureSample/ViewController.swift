//
//  ViewController.swift
//  GestureSample
//
//  Created by Hansub Yoo on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var outerView: UIView!
    
    @IBOutlet var innerView: UIView!
    
    var change = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outerView.isUserInteractionEnabled = true
        innerView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        outerView.addGestureRecognizer(tapGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(_:)))
        outerView.addGestureRecognizer(pinchGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotationGesture(_:)))
        outerView.addGestureRecognizer(rotationGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        panGesture.minimumNumberOfTouches = 3 // 손가락 3개 필요
        outerView.addGestureRecognizer(panGesture)
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(self.screenEdgeGesture(_:)))
        edgeGesture.edges = .right // 오른쪽 가장자리
        view.addGestureRecognizer(edgeGesture)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGesture(_:)))
        longPress.numberOfTouchesRequired = 2 // 터치 손가락 수
        longPress.numberOfTapsRequired = 2 // 터치 수. 추가적인 터치수라서 +1 해준 수를 터치해야한다.
        longPress.minimumPressDuration = 3 // 누르는 시간
        // 두 손가락으로 3번 터치해서 마지막에 3초간 눌러야한다.
        outerView.addGestureRecognizer(longPress)
    }
    
}

extension ViewController {
    @objc func tapGesture(_ sender: UIGestureRecognizer) {
        // 탭 액션
        print("tap")
        self.change = !self.change
        self.view.backgroundColor = change ? .white : .black
    }
    
    @objc func pinchGesture(_ sender: UIGestureRecognizer) {
        if let pinch = sender as? UIPinchGestureRecognizer {
            outerView.transform = outerView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            
            pinch.scale = 1.0
        }
    }
    
    @objc func rotationGesture(_ sender: UIGestureRecognizer) {
        if let rotation = sender as? UIRotationGestureRecognizer {
            outerView.transform = outerView.transform.rotated(by: rotation.rotation)
            
            rotation.rotation = 0
        }
    }
    
    @objc func panGesture(_ sender: UIGestureRecognizer) {
        if let pan = sender as? UIPanGestureRecognizer {
            let transition = pan.translation(in: outerView)
            let changedX = outerView.center.x + transition.x
            let changedY = outerView.center.y + transition.y
            outerView.center = CGPoint(x: changedX, y: changedY)

            pan.setTranslation(CGPoint.zero, in: outerView)
        }
    }
    
    @objc func swipeGesture(_ sender: UIGestureRecognizer) {
        if let swipe = sender as? UISwipeGestureRecognizer {
            print("swipe")
        }
    }
    
    @objc func screenEdgeGesture(_ sender: UIGestureRecognizer) {
        if let edge = sender as? UIScreenEdgePanGestureRecognizer {
            print("edge.edges")
            
            self.change = !self.change
            outerView.backgroundColor = change ? .red : .blue
        }
    }
    
    @objc func longPressGesture(_ sender: UIGestureRecognizer) {
        if let press = sender as? UILongPressGestureRecognizer {
            print("press")
            
            self.change = !self.change
            innerView.backgroundColor = change ? .yellow : .purple
        }
    }
    
}
