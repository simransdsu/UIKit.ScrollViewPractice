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
        
        // A label to keep the track of last label added to ScrollView
        var previousLabel: UILabel? = nil
        
        // Creating 300 labels and addingi to Scroll View
        for i in 1...300 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "This is label \(i)"
            scrollView.addSubview(label)
            
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).activate()
            label.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? scrollView.topAnchor, constant: 10).activate()
            
            previousLabel = label
        }
        
        // Attaching the last label to the bottom of scroll view to auto calculate the content size of the scroll view
        if let previousLabel = previousLabel {
            previousLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).activate()
            previousLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).activate()
        }
        
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
