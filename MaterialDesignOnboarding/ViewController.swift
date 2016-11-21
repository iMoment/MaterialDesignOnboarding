//
//  ViewController.swift
//  MaterialDesignOnboarding
//
//  Created by Stanley Pan on 21/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController, PaperOnboardingDataSource {
    
    lazy var mainImageView: OnboardingView = {
        let imageView = OnboardingView()
        imageView.dataSource = self
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
}






















