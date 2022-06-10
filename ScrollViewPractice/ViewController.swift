//
//  ViewController.swift
//  ScrollViewPractice
//
//  Created by Simran Preet Narang on 2022-06-10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NSLayoutConstraint {
    
    func activate() {
        isActive = true
    }
    
    func deActivate() {
        isActive = false
    }
}
