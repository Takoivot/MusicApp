//
//  FavoritesStreamController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 22.06.2022.
//

import UIKit

class FavoritesStreamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        NavBarSettings.shared.configureNavBar(for: navigationController)
    }
    
}

