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
        
        /*
         Third way where content view is self sizing based on the constraints
         from its subviews (labels). And the CV/s edges are pinned by constraints
         to the SV's content layout guide.
         */
        var previousLabel: UILabel? = nil
        
        for i in 0...299 {
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "This is label \(i + 1)"
            
            contentView.addSubview(label)
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).activate()
            label.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? contentView.topAnchor, constant: 10).activate()
            
            previousLabel = label
        }

        if let previousLabel = previousLabel {
            contentView.bottomAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 10).activate()
            contentView.trailingAnchor.constraint(equalTo: previousLabel.trailingAnchor, constant: 10).activate()
        }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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
