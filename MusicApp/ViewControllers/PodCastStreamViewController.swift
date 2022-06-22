//
//  PodCastStreamViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 21.06.2022.
//

import UIKit

class PodCastStreamViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        
    }
}

extension PodCastStreamViewController {
    private func configureNavBar() {
        view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.8352941176, blue: 0.7333333333, alpha: 1)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.7529411765, blue: 0.8862745098, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
