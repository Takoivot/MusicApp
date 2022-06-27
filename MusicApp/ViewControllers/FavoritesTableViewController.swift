//
//  FavoritesTableViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 21.06.2022.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var favoriteTracks: [Tracks?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewSettings.shared.tuneViewAppearance(for: tableView)
        NavBarSettings.shared.configureNavBar(for: navigationController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favorite", for: indexPath) as? FavoriteListViewCell else {return UITableViewCell()}
        guard let track = favoriteTracks[indexPath.row] else {return UITableViewCell()}
        cell.settingsCell(with: track)
        TableViewSettings.shared.tuneCellAppearance(for: cell)
        return cell
    }

}


