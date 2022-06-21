//
//  TabBarViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 20.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
}

extension TabBarViewController {
    private func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
}
