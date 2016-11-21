//
//  OnboardViewController.swift
//  MaterialDesignOnboarding
//
//  Created by Stanley Pan on 21/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit
import PaperOnboarding

class OnboardViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    lazy var mainImageView: OnboardingView = {
        let imageView = OnboardingView()
        imageView.dataSource = self
        imageView.delegate = self
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET STARTED", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 20)
        button.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func handleStartButton() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("true", forKey: "onboardingComplete")
        userDefaults.synchronize()
        
        let mainAppViewController = MainAppViewController()
        show(mainAppViewController, sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageView)
        view.addSubview(startButton)
        
        setupMainImageView()
        setupStartButton()
    }
    
    // iOS constraints x, y, width, height
    func setupMainImageView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func setupStartButton() {
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 136).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    // MARK: PaperOnboardingDataSource required methods
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorFirstPage = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorSecondPage = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThirdPage = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("rocket", "A Great Rocket Start", "Jelly beans carrot cake topping biscuit. Chocolate bar carrot cake donut marshmallow halvah. Fruitcake cake chocolate bar candy biscuit jujubes biscuit cake.", "", backgroundColorFirstPage, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("brush", "Design Your Experience", "Dessert chocolate halvah candy canes. Oat cake powder tart cookie cupcake gummies. Pudding brownie lollipop.", "", backgroundColorSecondPage, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("notification", "Stay Up To Date", "Topping pudding marshmallow. Gingerbread chocolate bar croissant. Cookie cheesecake dessert pudding croissant candy sugar plum carrot cake.", "", backgroundColorThirdPage, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
    }
    
    // MARK: PaperOnboardingDelegate required methods
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            
            if self.startButton.alpha == 1 {
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.startButton.alpha = 0
                    })
                }
            }
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.8, animations: {
                    self.startButton.alpha = 1
                })
            }
        }
    }
}






















