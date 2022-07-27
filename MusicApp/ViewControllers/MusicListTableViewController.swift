//
//  MusicListTableViewController.swift
//  MusicApp
//
//  Created by Артур Сахбиев on 17.06.2022.
//

import UIKit

class MusicListTableViewController: UITableViewController {
    
    var tracks: MusicModel? = nil
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewSettings.shared.tuneViewAppearance(for: tableView)
        NavBarSettings.shared.configureNavBar(for: navigationController)
        setupSearchBar()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks?.results.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "music", for: indexPath) as? MusicListViewCell else {return UITableViewCell()}
        guard let track = tracks?.results[indexPath.row] else {return UITableViewCell()}
        cell.settingsCell(with: track)
        TableViewSettings.shared.tuneCellAppearance(for: cell)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let musicSVC = segue.destination as? MusicStreamViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let track = tracks?.results[indexPath.row] else {return}
        musicSVC.track = track
        
        }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") {
            (_, _, actionPerformed: (Bool) -> ()) in
            let track = self.tracks?.results[indexPath.row]
            StorageManager.shared.save(
                artistName: track?.artistName ?? "",
                songName: track?.trackName ?? "",
                artwork: track?.artworkUrl60 ?? "",
                preview: track?.previewUrl ?? ""
            )
            actionPerformed(true)
        }
        favoriteAction.backgroundColor = UIColor.orange
        favoriteAction.image = UIImage(systemName: "star")
        let configuration = UISwipeActionsConfiguration(actions: [favoriteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
}


extension MusicListTableViewController : UISearchBarDelegate{
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            NetworkManager.shared.fetchTracksAF(searchText: searchText) {result in
                switch result {
                case .success(let tracks):
                    self.tracks = tracks
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
      
       
    }
}



