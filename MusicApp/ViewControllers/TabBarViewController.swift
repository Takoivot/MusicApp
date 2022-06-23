//
//  TabBarViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 20.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private var middleButton: UIButton = {
        let button = UIButton()
        let symbol = UIImage.SymbolConfiguration(pointSize: 15, weight: .heavy, scale: .large)
        button.setImage(UIImage(systemName: "star", withConfiguration: symbol), for: .normal)
        button.imageView?.tintColor = .white
        button.backgroundColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewTabBar()
        addMiddleButton()
        hideOldTabBar()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        middleButton.backgroundColor = .gray
    }
}

extension TabBarViewController {
    
    private func setNewTabBar() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
    
    private func hideOldTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = .none
        appearance.shadowColor = .clear
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func addMiddleButton() {
        DispatchQueue.main.async {
            if let items = self.tabBar.items {
                items[1].isEnabled = false
            }
        }
        
        tabBar.addSubview(middleButton)
        let size = CGFloat(50)
        let layerHeight = CGFloat()
        let constant: CGFloat = 20 + ( layerHeight / 2 ) - 5
        middleButton.layer.cornerRadius = size / 2
        
        let constraints = [
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor, constant: constant),
            middleButton.heightAnchor.constraint(equalToConstant: size),
            middleButton.widthAnchor.constraint(equalToConstant: size)
        ]
        for constraint in constraints {
            constraint.isActive = true
        }
        
        middleButton.layer.masksToBounds = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        
        middleButton.addTarget(self, action: #selector(buttonHandler(sender:)), for: .touchUpInside)
    }
    @objc func buttonHandler(sender: UIButton) {
        middleButton.backgroundColor = .tabBarItemAccent
        selectedIndex = 1
        if let navVC = tabBarController?.viewControllers?[1] as? UINavigationController {
            navVC.pushViewController(FavoritesTableViewController(), animated: true)
        }
    }
}



