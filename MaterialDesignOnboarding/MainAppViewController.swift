//
//  MainAppViewController.swift
//  MaterialDesignOnboarding
//
//  Created by Stanley Pan on 21/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    let mainAppLabel: UILabel = {
        let label = UILabel()
        label.text = "This will be the main application."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(mainAppLabel)
        
        setupMainAppLabel()
    }
    
    // iOS Constraints x, y, width, height
    func setupMainAppLabel() {
        mainAppLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainAppLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainAppLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        mainAppLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
