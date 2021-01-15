//
//  ViewController.swift
//  UILabelSample
//
//  Created by Hansub Yoo on 2021/01/15.
//

/*
 UILabel 관련 샘플은 여기서
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextStoryboard = UIStoryboard(name: "UpToDown", bundle: nil)
        let nextVC = nextStoryboard.instantiateViewController(identifier: "UpToDown")
        self.navigationController?.pushViewController(nextVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelSampleCell", for: indexPath)
        cell.textLabel?.text = sampleArray[indexPath.row]
        return cell
    }
}
