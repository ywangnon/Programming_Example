//
//  LimitCharacterViewController.swift
//  UITextViewSample
//
//  Created by Hansub Yoo on 2021/01/26.
//

import UIKit

class LimitCharacterViewController: UIViewController {
    private let limit = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension LimitCharacterViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let currentText = textView.text ?? ""
//        print("작동하나?")
//        guard let stringRange = Range(range, in: currentText) else {
//            print("guard")
//            return false
//        }
//
//        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
//
//        return updatedText.count <= 16
        let newLength = textView.text.count + text.count - range.length
        
        return !(newLength > 10)
    }
}

// 마지막에 받침을 넣을 수가 없다.

/*
 내 생각에는 유니코드의 갯수로 개수로 카운트되는 것이 아닌가 추측된다.
 마지막 글자 전 글자가 받침이 있냐 없냐에 따라 자음까지 넣을 수 있냐 없냐가 결정된다.
 예를 들어, '가나...마' 인 상태에서 '바'를 입력하려고 할때, 먼저 '...맙'의 상태에서 'ㅏ'를 넣으면 '가나...마바'의 상태가 되고 받침을 넣을 수 없게 된다.
 하지만 받침이 있다면, '간단간단...단'인 상태에서 '간'을 넣으려고 하면 '간단...단ㄱ'인 상태에서 더이상 넣을 수 없게 된다.
 즉, 사람이 볼때 전자는 글자가 완성된 상태로 입력이 안되고, 후자는 글자가 완성되지 않은 상태에서 입력이 안되지만, 컴퓨터 시점에서는 마지막에 '바'의 유니코드로 끝이나든, 'ㄱ'의 유니코드로 끝이 나던 카운트는 10으로 더이상 입력할 수 없는 상태가 된다.
 */
