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
        
        // Initializing ScrollView
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray4
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding SV to ViewController's `view`
        view.addSubview(scrollView)
        
        // Setting SV's constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        
        // Adding a content view into the scroll View.
        let contentView = UIView()
        scrollView.addSubview(contentView)
        
        // Adding items to content view without constraints
        // So settiing the contentSize of SV explicitely by calculating it
        var y: CGFloat = 10
        var maxW: CGFloat = 0
        
        for i in 0...299 {
            
            let label = UILabel()
            label.text = "This is label \(i + 1)"
            label.sizeToFit()
            label.frame.origin = CGPoint(x: 0, y: y)
            contentView.addSubview(label)
            y += label.frame.size.height + 10
            maxW = max(maxW, label.frame.maxX + 10)
        }
        
        // set content view width, height and edge constraints
        // content size is calculated for us
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewContentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: maxW),
            contentView.heightAnchor.constraint(equalToConstant: y),
            scrollViewContentLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollViewContentLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollViewContentLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollViewContentLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
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
