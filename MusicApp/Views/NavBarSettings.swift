//
//  NavBarSettings.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 26.06.2022.
//

import UIKit

class NavBarSettings {
    
    static let shared = NavBarSettings()
    
    private init () {}
    
    func configureNavBar(for navigationController: UINavigationController?) {
        guard let navigationController = navigationController else {
            return
        }
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.6174336672, green: 0.6075100303, blue: 0.5990644097, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }
}
