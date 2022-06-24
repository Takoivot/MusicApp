//
//  UIButtonExtension.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 24.06.2022.
//

import UIKit

extension UIButton {
    
    static var middleButton: UIButton = {
    let button = UIButton()
    let symbol = UIImage.SymbolConfiguration(pointSize: 15, weight: .heavy, scale: .large)
    button.setImage(UIImage(systemName: "star", withConfiguration: symbol), for: .normal)
    button.imageView?.tintColor = .white
    button.backgroundColor = .gray
    return button
    }()
}
