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
        view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.8352941176, blue: 0.7333333333, alpha: 1)
        NavBarSettings.shared.configureNavBar(for: navigationController)
    }
    
}

