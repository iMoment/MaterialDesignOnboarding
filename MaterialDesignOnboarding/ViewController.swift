//
//  ViewController.swift
//  MaterialDesignOnboarding
//
//  Created by Stanley Pan on 21/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController {
    
    let mainImageView: OnboardingView = {
        let imageView = OnboardingView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageView)
        
        setupMainImageView()
    }
    
    // iOS constraints x, y, width, height
    func setupMainImageView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}
