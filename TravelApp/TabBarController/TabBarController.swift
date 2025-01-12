//
//  TabBarController.swift
//  TravelApp
//
//  Created by Mac on 03.01.25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        tabBar.barTintColor = .systemGray5
    }
}
