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
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(scrollView)
        scrollView.backgroundColor = .lightGray
        
        var y: CGFloat = 10
        
        for i in 0..<300 {
            let label = UILabel()
            label.text = "This is label \(i+1)"
            label.sizeToFit()
            label.frame.origin = CGPoint(x: 10, y: y)
            scrollView.addSubview(label)
            y += label.bounds.size.height + 10
        }
        
        var scrollViewSize = scrollView.bounds.size
        print("Scroll View Height: ", scrollViewSize.height)
        scrollViewSize.height = y
        print("Scroll View Height Now: ", scrollViewSize.height)
        scrollView.contentSize = scrollViewSize
    }


}

