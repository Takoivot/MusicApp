//
//  FavoritesTableViewController.swift
//  MusicApp
//
//  Created by Maksim Grischenko on 21.06.2022.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var favoriteTracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewSettings.shared.tuneViewAppearance(for: tableView)
        NavBarSettings.shared.configureNavBar(for: navigationController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        StorageManager.shared.fetchData { tracks in
            favoriteTracks = tracks
        }
        tableView.reloadData()
    }
    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favorite", for: indexPath) as? FavoriteListViewCell else {return UITableViewCell()}
        let track = favoriteTracks[indexPath.row] 
        cell.settingsCell(with: track)
        TableViewSettings.shared.tuneCellAppearance(for: cell)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (_, _, actionPerformed: (Bool) -> ()) in
            let track = self.favoriteTracks[indexPath.row]
            StorageManager.shared.delete(track)
            self.favoriteTracks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
        }
        deleteAction.backgroundColor = UIColor.red
        deleteAction.image = UIImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
}
}


