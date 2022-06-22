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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FavoritesStreamViewController {
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
